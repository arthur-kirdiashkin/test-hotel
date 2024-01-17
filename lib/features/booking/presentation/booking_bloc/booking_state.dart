import 'package:equatable/equatable.dart';
import 'package:testovoe_hotel/features/booking/data/models/booking_model.dart';
import 'package:testovoe_hotel/features/booking/presentation/booking_widgets/tourist_widget.dart';

abstract class BookingState extends Equatable {}

class BookingLoadingState extends BookingState {
  @override
  List<Object?> get props => [];
}

class BookingLoadState extends BookingState {
  final List<Tourist> tourists;
  final BookingModel bookingModel;

  BookingLoadState({required this.bookingModel, required this.tourists});

  @override
  List<Object?> get props => [bookingModel];
}

class BookingLoadTouristsState extends BookingState {
  final List<Tourist> tourists;

  BookingLoadTouristsState({required this.tourists});

  @override

  // TODO: implement props
  List<Object?> get props => [tourists];
}

class BookingErrorState extends BookingState {
  final String message;

  BookingErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
