import 'package:tv_maze_demo/core/models/episode_model.dart';

class ApiConverter {
  static List<EpisodeModel>? convertToEpisodeList(Map<String, dynamic>? json) {
    if (json == null) {
      return [];
    }
    var episodes = <EpisodeModel>[];
    if (json?['episodes'] != null) {
      json?['episodes'].forEach((v) {
        episodes.add(EpisodeModel.fromJson(v));
      });
    }
    return episodes;
  }

  static String? convertModelToString(Map<String, dynamic>? json) {
    if (json == null) {
      return "";
    }
    var imageUrl = "";

    if (json?['medium'] != null) {
      imageUrl = json?['medium'];
    }
    return imageUrl;
  }
}
