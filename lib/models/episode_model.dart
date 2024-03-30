import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  @JsonKey(name: 'results')
  final EpisodeModelItem results;

  EpisodeModel(this.results);

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}

@JsonSerializable()
class EpisodeModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final EpisodeImage? image;

  @JsonKey(name: 'air_date')
  final DateTime? date;

  @JsonKey(name: 'episode_number')
  final String? number;

  EpisodeModelItem(this.url, this.name, this.image, this.date, this.number);

  factory EpisodeModelItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelItemToJson(this);
}

@JsonSerializable()
class EpisodeImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  EpisodeImage(this.originalUrl);

  factory EpisodeImage.fromJson(Map<String, dynamic> json) =>
      _$EpisodeImageFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeImageToJson(this);
}
