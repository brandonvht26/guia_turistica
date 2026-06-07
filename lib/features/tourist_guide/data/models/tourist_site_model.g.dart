// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist_site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TouristSiteModel _$TouristSiteModelFromJson(Map<String, dynamic> json) =>
    _TouristSiteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      location: json['location'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$TouristSiteModelToJson(_TouristSiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'isFavorite': instance.isFavorite,
    };
