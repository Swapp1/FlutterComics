import 'package:json_annotation/json_annotation.dart';

part 'series_details_model.g.dart';

@JsonSerializable()
class SeriesDetailsModel {
  @JsonKey(name: 'results')
  final SeriesDetailsModelItem results;

  SeriesDetailsModel(this.results);

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailsModelToJson(this);
}

@JsonSerializable()
class SeriesDetailsModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'publisher')
  final PersonList? publisher;

  @JsonKey(name: 'start_year')
  final String? date;

  @JsonKey(name: 'count_of_episodes')
  final int? nbepisodes;

  @JsonKey(name: 'image')
  final ListImage? image;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'characters')
  final List<CharactersList>? characters;

  @JsonKey(name: 'episodes')
  final List<CharactersList>? episodes;


  SeriesDetailsModelItem(
      this.url,
      this.name,
      this.image,
      this.date,
      this.description,
      this.characters,this.nbepisodes,this.publisher,this.episodes);

  factory SeriesDetailsModelItem.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailsModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesDetailsModelItemToJson(this);
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

  CharactersList(this.name, this.url);

  factory CharactersList.fromJson(Map<String, dynamic> json) =>
      _$CharactersListFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersListToJson(this);
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
