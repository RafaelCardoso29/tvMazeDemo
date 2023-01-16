import 'package:tv_maze_demo/core/network/models/image_model.dart';

class ImageModelMapper {
  static String convertModelToString(ImageModel imageModel) =>
      imageModel.medium ?? "";
}
