// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDto _$HomeDtoFromJson(Map<String, dynamic> json) => HomeDto(
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$HomeDtoToJson(HomeDto instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
};
