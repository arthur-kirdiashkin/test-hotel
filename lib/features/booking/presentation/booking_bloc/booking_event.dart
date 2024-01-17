import 'package:equatable/equatable.dart';


abstract class BookingEvent extends Equatable {}

class BookingLoadEvent extends BookingEvent {
  @override
  List<Object?> get props => [];
}

class BookingLoadTouristEvent extends BookingEvent {
  // final Tourist tourist;

  BookingLoadTouristEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
