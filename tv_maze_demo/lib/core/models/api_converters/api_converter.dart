import 'package:tv_maze_demo/core/models/episode_model.dart';

class ApiConverter {
  static List<EpisodeModel> convertToEpisodeList(Map<String, dynamic> json) {
    var episodes = <EpisodeModel>[];
    if (json['episodes'] != null) {
      json['episodes'].forEach((v) {
        episodes.add(EpisodeModel.fromJson(v));
      });
    }
    return episodes;
  }

  static String convertModelToString(Map<String, dynamic> json) {
    var imageUrl = "";
    if (json['original'] != null) {
      imageUrl = json['original'];
    }
    return imageUrl;
  }
}
