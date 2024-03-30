import 'package:json_annotation/json_annotation.dart';

part 'comics_details_model.g.dart';

@JsonSerializable()
class ComicsDetailsModel {
  @JsonKey(name: 'results')
  final ComicsDetailsModelItem results;

  ComicsDetailsModel(this.results);

  factory ComicsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsDetailsModelToJson(this);
}

@JsonSerializable()
class ComicsDetailsModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'person_credits')
  final List<CharactersList>? writers;

  @JsonKey(name: 'image')
  final ListImage? image;

  @JsonKey(name: 'character_credits')
  final List<CharactersList>? characters;

  @JsonKey(name: 'volume')
  final ListVolume? volume;

   @JsonKey(name: 'issue_number')
  final String? number;

  @JsonKey(name: 'cover_date')
  final String? date;

  ComicsDetailsModelItem(this.url, this.name, this.image, this.date, this.description, this.characters, this.writers, this.number, this.volume);

  factory ComicsDetailsModelItem.fromJson(Map<String, dynamic> json) =>
      _$ComicsDetailsModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsDetailsModelItemToJson(this);
}

@JsonSerializable()
class ListImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  ListImage(this.originalUrl);

  factory ListImage.fromJson(Map<String, dynamic> json) =>
      _$ListImageFromJson(json);
  Map<String, dynamic> toJson() => _$ListImageToJson(this);
}

@JsonSerializable()
class CharactersList {
  @JsonKey(name: 'api_detail_url')
  final String? url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'role')
  final String? role;

  CharactersList(this.name, this.url, this.role);

  factory CharactersList.fromJson(Map<String, dynamic> json) =>
      _$CharactersListFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersListToJson(this);
}


@JsonSerializable()
class ListVolume {
  @JsonKey(name: 'name')
  final String? volumeName;

  ListVolume(this.volumeName);

  factory ListVolume.fromJson(Map<String, dynamic> json) =>
      _$ListVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$ListVolumeToJson(this);
}

