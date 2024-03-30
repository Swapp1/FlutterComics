// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      EpisodeModelItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

EpisodeModelItem _$EpisodeModelItemFromJson(Map<String, dynamic> json) =>
    EpisodeModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : EpisodeImage.fromJson(json['image'] as Map<String, dynamic>),
      json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      json['episode_number'] as String?,
    );

Map<String, dynamic> _$EpisodeModelItemToJson(EpisodeModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'air_date': instance.date?.toIso8601String(),
      'episode_number': instance.number,
    };

EpisodeImage _$EpisodeImageFromJson(Map<String, dynamic> json) => EpisodeImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$EpisodeImageToJson(EpisodeImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };
