import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/features/booking/data/repository/booking_repository.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_event.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_bloc/booking_state.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/tourist_widget.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  List<Tourist> tourists = [Tourist(touristText: 'Турист')];
  final BookingRepository bookingRepository;
  BookingBloc(this.bookingRepository) : super(BookingLoadingState()) {
    on<BookingEvent>(
      (event, emit) async {
        if (event is BookingLoadEvent) {
          try {
            final response = await bookingRepository.getBooking();
            emit(BookingLoadState(bookingModel: response, tourists: tourists));
          } catch (e) {
            emit(BookingErrorState(message: e.toString()));
          }
        } else if (event is BookingLoadTouristEvent) {
          final Tourist tourist = Tourist(touristText: 'Турист');
          final response = await bookingRepository.getBooking();
          tourists.add(tourist);

          emit(BookingLoadState(tourists: tourists, bookingModel: response));
        }
      },
    );
  }
}
