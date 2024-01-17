
import 'package:json_annotation/json_annotation.dart';
part 'about_the_hotel_model.g.dart';
@JsonSerializable(explicitToJson: true)
class AboutTheHotelModel {
  final String? description;
  final List<String>? peculiarities;

  AboutTheHotelModel({
    required this.description,
    required this.peculiarities,

    
  });

  factory AboutTheHotelModel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutTheHotelModelToJson(this);
}
