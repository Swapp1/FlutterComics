import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  @JsonKey(name: 'results')
  final List<EventModelItem> results;

  EventModel(this.results);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}

@JsonSerializable()
class EventModelItem {
  @JsonKey(name: 'site_detail_url')
  final String url;

  @JsonKey(name: 'title')
  final String? name;

  @JsonKey(name: 'image')
  final EventImage? image;

  EventModelItem(this.url, this.name, this.image);

  factory EventModelItem.fromJson(Map<String, dynamic> json) =>
      _$EventModelItemFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelItemToJson(this);
}

@JsonSerializable()
class EventImage {
  @JsonKey(name: 'original')
  final String? originalUrl;

  EventImage(this.originalUrl);

  factory EventImage.fromJson(Map<String, dynamic> json) =>
      _$EventImageFromJson(json);
  Map<String, dynamic> toJson() => _$EventImageToJson(this);
}
