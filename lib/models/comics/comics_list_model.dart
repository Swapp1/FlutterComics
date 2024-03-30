import 'package:json_annotation/json_annotation.dart';

part 'comics_list_model.g.dart';

@JsonSerializable()
class ComicsListModel {
  @JsonKey(name: 'results')
  final List<ComicsListModelItem> results;

  ComicsListModel(this.results);

  factory ComicsListModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsListModelToJson(this);
}

@JsonSerializable()
class ComicsListModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cover_date')
  final String? date;

  @JsonKey(name: 'issue_number')
  final String? number;


  @JsonKey(name: 'image')
  final ListImage? image;

  @JsonKey(name: 'volume')
  final ListVolume? volume;


  ComicsListModelItem(this.url, this.name, this.image, this.date, this.number, this.volume);

  factory ComicsListModelItem.fromJson(Map<String, dynamic> json) =>
      _$ComicsListModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsListModelItemToJson(this);
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
class ListVolume {
  @JsonKey(name: 'name')
  final String? volumeName;

  ListVolume(this.volumeName);

  factory ListVolume.fromJson(Map<String, dynamic> json) =>
      _$ListVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$ListVolumeToJson(this);
}