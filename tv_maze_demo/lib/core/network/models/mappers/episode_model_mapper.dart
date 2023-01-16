import 'package:tv_maze_demo/core/network/models/episode_model.dart';

class EpisodeModelMapper {
  static List<EpisodeModel> convertToEpisodeList(Map<String, dynamic> json) {
    var episodes = <EpisodeModel>[];
    if (json['episodes'] != null) {
      json['episodes'].forEach((v) {
        episodes.add(EpisodeModel.fromJson(v));
      });
    }
    return episodes;
  }
}
