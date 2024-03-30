// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      (json['results'] as List<dynamic>)
          .map((e) => EventModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

EventModelItem _$EventModelItemFromJson(Map<String, dynamic> json) =>
    EventModelItem(
      json['site_detail_url'] as String,
      json['title'] as String?,
      json['image'] == null
          ? null
          : EventImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventModelItemToJson(EventModelItem instance) =>
    <String, dynamic>{
      'site_detail_url': instance.url,
      'title': instance.name,
      'image': instance.image,
    };

EventImage _$EventImageFromJson(Map<String, dynamic> json) => EventImage(
      json['original'] as String?,
    );

Map<String, dynamic> _$EventImageToJson(EventImage instance) =>
    <String, dynamic>{
      'original': instance.originalUrl,
    };
