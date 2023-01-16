import 'package:tv_maze_demo/core/models/show_model.dart';
import 'package:tv_maze_demo/core/network/base_api.dart';
import 'package:tv_maze_demo/core/network/app_exceptions.dart';

abstract class ShowsDetailsDataSource {
  Future<ShowModel> getShow();
}

class ShowsDetailsRemoteDataSource implements ShowsDetailsDataSource {
  BaseApi baseAPi = BaseApi();

  @override
  Future<ShowModel> getShow() async {
    try {
      final params = {'q': 'Powerpuff Girls', 'embed': "episodes"};
      var response =
          await baseAPi.get("singlesearch/shows", queryParameters: params);
      final showModel = ShowModel.fromJson(response);
      return showModel;
    } catch (e) {
      throw GenericApiError(e.toString());
    }
  }
}

class ShowsDetailsMockDataSource implements ShowsDetailsDataSource {
  @override
  Future<ShowModel> getShow() {
    throw UnimplementedError();
  }
}
