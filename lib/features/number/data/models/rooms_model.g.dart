// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Roomsmodel _$RoomsmodelFromJson(Map<String, dynamic> json) => Roomsmodel(
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsmodelToJson(Roomsmodel instance) =>
    <String, dynamic>{
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
    };
