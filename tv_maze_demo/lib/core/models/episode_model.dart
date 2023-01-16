import 'package:json_annotation/json_annotation.dart';
import 'package:tv_maze_demo/core/models/api_converters/api_converter.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  int? id;
  String? name;
  @JsonKey(fromJson: ApiConverter.convertModelToString)
  String? image;
  String? summary;
  int? season;
  int? number;
  int? runtime;

  EpisodeModel(
      {this.id,
      this.name,
      this.image,
      this.summary,
      this.season,
      this.number,
      this.runtime});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
