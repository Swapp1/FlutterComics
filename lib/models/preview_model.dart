import 'package:json_annotation/json_annotation.dart';

part 'preview_model.g.dart';

@JsonSerializable()
class PreviewModel {
  @JsonKey(name: 'results')
  final List<PreviewModelItem> results;

  PreviewModel(this.results);

  factory PreviewModel.fromJson(Map<String, dynamic> json) =>
      _$PreviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviewModelToJson(this);
}

@JsonSerializable()
class PreviewModelItem {
  @JsonKey(name: 'api_detail_url')
  final String url;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final PreviewImage? image;

  PreviewModelItem(this.url, this.name, this.image);

  factory PreviewModelItem.fromJson(Map<String, dynamic> json) =>
      _$PreviewModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$PreviewModelItemToJson(this);
}

@JsonSerializable()
class PreviewImage {
  @JsonKey(name: 'original_url')
  final String? originalUrl;

  PreviewImage(this.originalUrl);

  factory PreviewImage.fromJson(Map<String, dynamic> json) =>
      _$PreviewImageFromJson(json);
  Map<String, dynamic> toJson() => _$PreviewImageToJson(this);
}
