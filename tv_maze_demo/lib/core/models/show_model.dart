import 'package:json_annotation/json_annotation.dart';
import 'package:tv_maze_demo/core/models/episode_model.dart';
import 'api_converters/api_converter.dart';

part 'show_model.g.dart';

@JsonSerializable()
class ShowModel {
  int? id;
  String? url;
  String? name;
  List<String>? genres;
  @JsonKey(fromJson: ApiConverter.convertModelToString)
  String? image;
  String? summary;
  @JsonKey(fromJson: ApiConverter.convertToEpisodeList, name: "_embedded")
  List<EpisodeModel>? episodes;

  ShowModel(this.id, this.url, this.name, this.genres, this.image, this.summary,
      this.episodes);

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}
