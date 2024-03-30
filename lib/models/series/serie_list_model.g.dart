// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesListModel _$SeriesListModelFromJson(Map<String, dynamic> json) =>
    SeriesListModel(
      (json['results'] as List<dynamic>)
          .map((e) => SeriesListModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesListModelToJson(SeriesListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeriesListModelItem _$SeriesListModelItemFromJson(Map<String, dynamic> json) =>
    SeriesListModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['start_year'] as String?,
      json['publisher'] == null
          ? null
          : Publisherinfo.fromJson(json['publisher'] as Map<String, dynamic>),
      json['count_of_episodes'] as int?,
    );

Map<String, dynamic> _$SeriesListModelItemToJson(
        SeriesListModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'publisher': instance.publisher,
      'start_year': instance.date,
      'count_of_episodes': instance.nbepisodes,
      'image': instance.image,
    };

ListImage _$ListImageFromJson(Map<String, dynamic> json) => ListImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ListImageToJson(ListImage instance) => <String, dynamic>{
      'original_url': instance.originalUrl,
    };

Publisherinfo _$PublisherinfoFromJson(Map<String, dynamic> json) =>
    Publisherinfo(
      json['name'] as String?,
    );

Map<String, dynamic> _$PublisherinfoToJson(Publisherinfo instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
