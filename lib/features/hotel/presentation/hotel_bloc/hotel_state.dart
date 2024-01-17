import 'package:equatable/equatable.dart';
import 'package:testovoe_hotel/features/hotel/data/models/hotel_model.dart';

abstract class HotelState extends Equatable {}

class HotelLoadingState extends HotelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HotelLoadState extends HotelState {
  final HotelModel hotelModel;

  HotelLoadState({required this.hotelModel});

  @override
  // TODO: implement props
  List<Object?> get props => [hotelModel];
}

class HotelErrorState extends HotelState {
  final String message;

  HotelErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
