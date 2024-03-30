// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsListModel _$ComicsListModelFromJson(Map<String, dynamic> json) =>
    ComicsListModel(
      (json['results'] as List<dynamic>)
          .map((e) => ComicsListModelItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsListModelToJson(ComicsListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicsListModelItem _$ComicsListModelItemFromJson(Map<String, dynamic> json) =>
    ComicsListModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['cover_date'] as String?,
      json['issue_number'] as String?,
      json['volume'] == null
          ? null
          : ListVolume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsListModelItemToJson(
        ComicsListModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'cover_date': instance.date,
      'issue_number': instance.number,
      'image': instance.image,
      'volume': instance.volume,
    };

ListImage _$ListImageFromJson(Map<String, dynamic> json) => ListImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ListImageToJson(ListImage instance) => <String, dynamic>{
      'original_url': instance.originalUrl,
    };

ListVolume _$ListVolumeFromJson(Map<String, dynamic> json) => ListVolume(
      json['name'] as String?,
    );

Map<String, dynamic> _$ListVolumeToJson(ListVolume instance) =>
    <String, dynamic>{
      'name': instance.volumeName,
    };
