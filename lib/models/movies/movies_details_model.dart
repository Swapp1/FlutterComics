import 'package:json_annotation/json_annotation.dart';

part 'movies_details_model.g.dart';

@JsonSerializable()
class MoviesDetailsModel {
  @JsonKey(name: 'results')
  final MoviesDetailsModelItem results;

  MoviesDetailsModel(this.results);

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDetailsModelToJson(this);
}

@JsonSerializable()
class MoviesDetailsModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'runtime')
  final String? runtime;

  @JsonKey(name: 'release_date')
  final DateTime? date;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'budget')
  final String? budget;

  @JsonKey(name: 'box_office_revenue')
  final String? boxoffice;

  @JsonKey(name: 'distributor')
  final String? distributeur;

  @JsonKey(name: 'producers')
  final List<PersonList>? producers;

  @JsonKey(name: 'rating')
  final String? rating;

  @JsonKey(name: 'studios')
  final List<PersonList>? studios;

  @JsonKey(name: 'total_revenue')
  final String? totalrevenue;

  @JsonKey(name: 'writers')
  final List<PersonList>? writers;

  @JsonKey(name: 'image')
  final ListImage? image;

  @JsonKey(name: 'characters')
  final List<CharactersList>? characters;

  MoviesDetailsModelItem(this.url, this.name, this.image, this.date,
      this.runtime, this.description, this.characters, this.boxoffice,this.budget,this.distributeur,this.producers,this.rating,this.studios,this.totalrevenue,this.writers);

  factory MoviesDetailsModelItem.fromJson(Map<String, dynamic> json) =>
      _$MoviesDetailsModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDetailsModelItemToJson(this);
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
