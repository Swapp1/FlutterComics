// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personnage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonnageModel _$PersonnageModelFromJson(Map<String, dynamic> json) =>
    PersonnageModel(
      PersonnageModelItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonnageModelToJson(PersonnageModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PersonnageModelItem _$PersonnageModelItemFromJson(Map<String, dynamic> json) =>
    PersonnageModelItem(
      json['api_detail_url'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : PersonnageImage.fromJson(json['image'] as Map<String, dynamic>),
      json['description'] as String?,
      json['aliases'] as String?,
      json['birth'] as String?,
      (json['creators'] as List<dynamic>?)
          ?.map((e) => PersonList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['gender'] as int?,
      json['real_name'] as String?,
    );

Map<String, dynamic> _$PersonnageModelItemToJson(
        PersonnageModelItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'birth': instance.birth,
      'aliases': instance.aliases,
      'gender': instance.gender,
      'real_name': instance.realname,
      'creators': instance.creators,
    };

PersonnageImage _$PersonnageImageFromJson(Map<String, dynamic> json) =>
    PersonnageImage(
      json['original_url'] as String?,
    );

Map<String, dynamic> _$PersonnageImageToJson(PersonnageImage instance) =>
    <String, dynamic>{
      'original_url': instance.originalUrl,
    };

PersonList _$PersonListFromJson(Map<String, dynamic> json) => PersonList(
      json['name'] as String?,
    );

Map<String, dynamic> _$PersonListToJson(PersonList instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
