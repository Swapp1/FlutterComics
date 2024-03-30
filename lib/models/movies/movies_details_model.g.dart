// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesDetailsModel _$MoviesDetailsModelFromJson(Map<String, dynamic> json) =>
    MoviesDetailsModel(
      MoviesDetailsModelItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesDetailsModelToJson(MoviesDetailsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MoviesDetailsModelItem _$MoviesDetailsModelItemFromJson(
        Map<String, dynamic> json) =>
    MoviesDetailsModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : ListImage.fromJson(json['image'] as Map<String, dynamic>),
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      json['runtime'] as String?,
      json['description'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) => CharactersList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['box_office_revenue'] as String?,
      json['budget'] as String?,
      json['distributor'] as String?,
      (json['producers'] as List<dynamic>?)
          ?.map((e) => PersonList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['rating'] as String?,
      (json['studios'] as List<dynamic>?)
          ?.map((e) => PersonList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_revenue'] as String?,
      (json['writers'] as List<dynamic>?)
          ?.map((e) => PersonList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesDetailsModelItemToJson(
        MoviesDetailsModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'runtime': instance.runtime,
      'release_date': instance.date?.toIso8601String(),
      'description': instance.description,
      'budget': instance.budget,
      'box_office_revenue': instance.boxoffice,
      'distributor': instance.distributeur,
      'producers': instance.producers,
      'rating': instance.rating,
      'studios': instance.studios,
      'total_revenue': instance.totalrevenue,
      'writers': instance.writers,
      'image': instance.image,
      'characters': instance.characters,
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
