// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListModel _$MoviesListModelFromJson(Map<String, dynamic> json) =>
    MoviesListModel(
      (json['results'] as List<dynamic>)
          .map((e) => MoviesListModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesListModelToJson(MoviesListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MoviesListModelItem _$MoviesListModelItemFromJson(Map<String, dynamic> json) =>
    MoviesListModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      json['runtime'] as String?,
    );

Map<String, dynamic> _$MoviesListModelItemToJson(
        MoviesListModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'runtime': instance.runtime,
      'release_date': instance.date?.toIso8601String(),
      'image': instance.image,
    };

ListImage _$ListImageFromJson(Map<String, dynamic> json) => ListImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ListImageToJson(ListImage instance) => <String, dynamic>{
      'original_url': instance.originalUrl,
    };
