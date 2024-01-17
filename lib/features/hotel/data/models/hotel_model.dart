import 'package:json_annotation/json_annotation.dart';
import 'package:testovoe_hotel/features/hotel/data/models/about_the_hotel_model.dart';
part 'hotel_model.g.dart';
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class HotelModel {
  final int? id;
  final String? name;
  final String? adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String>? imageUrls;
  final AboutTheHotelModel? aboutTheHotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

factory HotelModel.fromJson(Map<String, dynamic> json) => _$HotelModelFromJson(json);

Map<String, dynamic> toJson() => _$HotelModelToJson(this);
 
}


