// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviewModel _$PreviewModelFromJson(Map<String, dynamic> json) => PreviewModel(
      (json['results'] as List<dynamic>)
          .map((e) => PreviewModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PreviewModelToJson(PreviewModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PreviewModelItem _$PreviewModelItemFromJson(Map<String, dynamic> json) =>
    PreviewModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : PreviewImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreviewModelItemToJson(PreviewModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'image': instance.image,
    };

PreviewImage _$PreviewImageFromJson(Map<String, dynamic> json) => PreviewImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$PreviewImageToJson(PreviewImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };
