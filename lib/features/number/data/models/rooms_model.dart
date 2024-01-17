import 'package:json_annotation/json_annotation.dart';
import 'package:testovoe_hotel/features/number/data/models/room_model.dart';
part 'rooms_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake,)
class Roomsmodel {
  final List<RoomModel>? rooms;

  Roomsmodel({required this.rooms});

  factory Roomsmodel.fromJson(Map<String, dynamic> json) => _$RoomsmodelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsmodelToJson(this);
}
