import 'package:json_annotation/json_annotation.dart';

part 'serie_list_model.g.dart';

@JsonSerializable()
class SeriesListModel {
  @JsonKey(name: 'results')
  final List<SeriesListModelItem> results;

  SeriesListModel(this.results);

  factory SeriesListModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesListModelToJson(this);
}

@JsonSerializable()
class SeriesListModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'publisher')
  final Publisherinfo? publisher;

  @JsonKey(name: 'start_year')
  final String? date;

  @JsonKey(name: 'count_of_episodes')
  final int? nbepisodes;

  @JsonKey(name: 'image')
  final ListImage? image;

  SeriesListModelItem(this.url, this.name, this.image, this.date, this.publisher,
      this.nbepisodes);

  factory SeriesListModelItem.fromJson(Map<String, dynamic> json) =>
      _$SeriesListModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesListModelItemToJson(this);
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
class Publisherinfo {
  @JsonKey(name: 'name')
  final String? name;

  Publisherinfo(this.name);

  factory Publisherinfo.fromJson(Map<String, dynamic> json) =>
      _$PublisherinfoFromJson(json);
  Map<String, dynamic> toJson() => _$PublisherinfoToJson(this);
}
