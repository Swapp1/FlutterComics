// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsDetailsModel _$ComicsDetailsModelFromJson(Map<String, dynamic> json) =>
    ComicsDetailsModel(
      ComicsDetailsModelItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsDetailsModelToJson(ComicsDetailsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicsDetailsModelItem _$ComicsDetailsModelItemFromJson(
        Map<String, dynamic> json) =>
    ComicsDetailsModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['cover_date'] as String?,
      json['description'] as String?,
      (json['character_credits'] as List<dynamic>?)
          ?.map((e) => CharactersList.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['person_credits'] as List<dynamic>?)
          ?.map((e) => CharactersList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['issue_number'] as String?,
      json['volume'] == null
          ? null
          : ListVolume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsDetailsModelItemToJson(
        ComicsDetailsModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'description': instance.description,
      'person_credits': instance.writers,
      'image': instance.image,
      'character_credits': instance.characters,
      'volume': instance.volume,
      'issue_number': instance.number,
      'cover_date': instance.date,
    };

ListImage _$ListImageFromJson(Map<String, dynamic> json) => ListImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$ListImageToJson(ListImage instance) => <String, dynamic>{
      'original_url': instance.originalUrl,
    };

CharactersList _$CharactersListFromJson(Map<String, dynamic> json) =>
    CharactersList(
      json['name'] as String?,
      json['api_detail_url'] as String?,
      json['role'] as String?,
    );

Map<String, dynamic> _$CharactersListToJson(CharactersList instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'role': instance.role,
    };

ListVolume _$ListVolumeFromJson(Map<String, dynamic> json) => ListVolume(
      json['name'] as String?,
    );

Map<String, dynamic> _$ListVolumeToJson(ListVolume instance) =>
    <String, dynamic>{
      'name': instance.volumeName,
    };
