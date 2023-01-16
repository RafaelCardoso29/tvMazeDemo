import 'package:tv_maze_demo/core/network/models/show_model.dart';
import 'package:tv_maze_demo/features/shows_details/data/shows_details_data_source.dart';

class ShowsDetailsRepository {
  final ShowsDetailsDataSource dataSource;

  ShowsDetailsRepository(this.dataSource);

  Future<ShowModel> getShow() async {
    return dataSource.getShow();
  }
}
