import 'package:json_annotation/json_annotation.dart';

part 'personnage_model.g.dart';

@JsonSerializable()
class PersonnageModel {
  @JsonKey(name: 'results')
  final PersonnageModelItem results;

  PersonnageModel(this.results);

  factory PersonnageModel.fromJson(Map<String, dynamic> json) =>
      _$PersonnageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonnageModelToJson(this);
}

@JsonSerializable()
class PersonnageModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final PersonnageImage? image;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'birth')
  final String? birth;

  @JsonKey(name: 'aliases')
  final String? aliases;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'real_name')
  final String? realname;

  @JsonKey(name: 'creators')
  final List<PersonList>? creators;

  PersonnageModelItem(this.url, this.name, this.image, this.description,
      this.aliases, this.birth, this.creators, this.gender, this.realname);

  factory PersonnageModelItem.fromJson(Map<String, dynamic> json) =>
      _$PersonnageModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonnageModelItemToJson(this);
}

@JsonSerializable()
class PersonnageImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  PersonnageImage(this.originalUrl);

  factory PersonnageImage.fromJson(Map<String, dynamic> json) =>
      _$PersonnageImageFromJson(json);
  Map<String, dynamic> toJson() => _$PersonnageImageToJson(this);
}

@JsonSerializable()
class PersonList {
  @JsonKey(name: 'name')
  final String? name;

  PersonList(this.name);

  factory PersonList.fromJson(Map<String, dynamic> json) =>
      _$PersonListFromJson(json);
  Map<String, dynamic> toJson() => _$PersonListToJson(this);
}
