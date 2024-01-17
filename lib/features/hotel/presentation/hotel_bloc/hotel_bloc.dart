import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe_hotel/features/hotel/data/repository/hotel_repository.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_event.dart';
import 'package:testovoe_hotel/features/hotel/presentation/hotel_bloc/hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepository;

  HotelBloc(this.hotelRepository) : super(HotelLoadingState()) {
    on<HotelLoadEvent>(_loadHotel);
  }

  _loadHotel(HotelLoadEvent event, emit) async {
    try {
      final response = await hotelRepository.getHotel();
      emit(HotelLoadState(hotelModel: response));
    } catch (e) {
      emit(HotelErrorState(message: e.toString()));
    }
  }
}
