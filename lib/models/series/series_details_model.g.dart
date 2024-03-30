// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetailsModel _$SeriesDetailsModelFromJson(Map<String, dynamic> json) =>
    SeriesDetailsModel(
      SeriesDetailsModelItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeriesDetailsModelToJson(SeriesDetailsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeriesDetailsModelItem _$SeriesDetailsModelItemFromJson(
        Map<String, dynamic> json) =>
    SeriesDetailsModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['start_year'] as String?,
      json['description'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) => CharactersList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count_of_episodes'] as int?,
      json['publisher'] == null
          ? null
          : PersonList.fromJson(json['publisher'] as Map<String, dynamic>),
      (json['episodes'] as List<dynamic>?)
          ?.map((e) => CharactersList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesDetailsModelItemToJson(
        SeriesDetailsModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'publisher': instance.publisher,
      'start_year': instance.date,
      'count_of_episodes': instance.nbepisodes,
      'image': instance.image,
      'description': instance.description,
      'characters': instance.characters,
      'episodes': instance.episodes,
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
    );

Map<String, dynamic> _$CharactersListToJson(CharactersList instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
    };

PersonList _$PersonListFromJson(Map<String, dynamic> json) => PersonList(
      json['name'] as String?,
    );

Map<String, dynamic> _$PersonListToJson(PersonList instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
