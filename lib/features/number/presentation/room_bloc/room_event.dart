import 'package:equatable/equatable.dart';

abstract class RoomEvent extends Equatable {}

class RoomLoadEvent extends RoomEvent {
  @override
  List<Object?> get props => [];
}
