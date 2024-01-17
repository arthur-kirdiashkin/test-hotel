import 'package:json_annotation/json_annotation.dart';
part 'booking_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class BookingModel {
  final int? id;
  final String? hotelName;
  final String? hotelAdress;
  final int? horating;
  final String? ratingName;
  final String? departure;
  final String? arrivalCountry;
  final String? tourDateStart;
  final String? tourDateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? tourPrice;
  final int? fuelCharge;
  final int? serviceCharge;

  const BookingModel(
      {required this.id,
      required this.hotelName,
      required this.hotelAdress,
      required this.horating,
      required this.ratingName,
      required this.departure,
      required this.arrivalCountry,
      required this.tourDateStart,
      required this.tourDateStop,
      required this.numberOfNights,
      required this.room,
      required this.nutrition,
      required this.tourPrice,
      required this.fuelCharge,
      required this.serviceCharge});

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
