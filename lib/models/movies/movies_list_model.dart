import 'package:json_annotation/json_annotation.dart';

part 'movies_list_model.g.dart';

@JsonSerializable()
class MoviesListModel {
  @JsonKey(name: 'results')
  final List<MoviesListModelItem> results;

  MoviesListModel(this.results);

  factory MoviesListModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListModelToJson(this);
}

@JsonSerializable()
class MoviesListModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'runtime')
  final String? runtime;

  @JsonKey(name: 'release_date')
  final DateTime? date;


  @JsonKey(name: 'image')
  final ListImage? image;



  MoviesListModelItem(this.url, this.name, this.image, this.date,this.runtime);

  factory MoviesListModelItem.fromJson(Map<String, dynamic> json) =>
      _$MoviesListModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListModelItemToJson(this);
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
