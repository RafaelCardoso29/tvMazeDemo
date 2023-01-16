import 'package:json_annotation/json_annotation.dart';
import 'package:tv_maze_demo/core/network/models/episode_model.dart';
import 'package:tv_maze_demo/core/network/models/image_model.dart';
import 'package:tv_maze_demo/core/network/models/mappers/episode_model_mapper.dart';
import 'package:tv_maze_demo/core/network/models/mappers/image_model_mapper.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  int? id;
  String? url;
  String? name;
  List<String>? genres;
  @JsonKey(fromJson: ImageModelMapper.convertModelToString)
  String? image;
  String? summary;
  @JsonKey(fromJson: EpisodeModelMapper.convertToEpisodeList, name: "_embedded")
  List<EpisodeModel>? episodes;

  ShowModel(this.id, this.url, this.name, this.genres, this.image, this.summary,
      this.episodes);

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
