import 'package:json_annotation/json_annotation.dart';
import 'package:tv_maze_demo/core/network/models/image_model.dart';
import 'package:tv_maze_demo/core/network/models/mappers/image_model_mapper.dart';

part 'episode_model.g.dart';

@JsonSerializable()
class EpisodeModel {
  int? id;
  String? name;
  @JsonKey(fromJson: ImageModelMapper.convertModelToString)
  String? image;
  String? summary;

  EpisodeModel({this.id, this.name, this.image, this.summary});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
