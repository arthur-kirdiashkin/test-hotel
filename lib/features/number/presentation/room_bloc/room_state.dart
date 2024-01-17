import 'package:equatable/equatable.dart';
import 'package:testovoe_hotel/features/number/data/models/rooms_model.dart';

abstract class RoomState extends Equatable {}

class RoomLoadingState extends RoomState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RoomLoadState extends RoomState {
  final Roomsmodel roomsmodel;

  RoomLoadState({required this.roomsmodel});

  @override
  // TODO: implement props
  List<Object?> get props => [roomsmodel];
}

class RoomErrorState extends RoomState {
  final String message;

  RoomErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
