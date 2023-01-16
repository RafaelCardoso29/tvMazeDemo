import 'package:tv_maze_demo/core/network/models/image_model.dart';

class ImageModelMapper {
  static String convertModelToString(Map<String, dynamic> json) {
    var imageUrl = "";
    if (json['original'] != null) {
      imageUrl = json['original'];
    }
    return imageUrl;
  }
}
