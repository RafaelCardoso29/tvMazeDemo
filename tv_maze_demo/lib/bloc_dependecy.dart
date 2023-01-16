import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_demo/features/shows_details/data/shows_details_data_source.dart';
import 'package:tv_maze_demo/features/shows_details/data/shows_details_repository.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/cubit/shows_details_cubit.dart';

class BlocDependency {
  static setBlocs() {
    return [
      BlocProvider<ShowsDetailsCubit>(
          create: ((context) => ShowsDetailsCubit(
              ShowsDetailsRepository(ShowsDetailsRemoteDataSource()))))
    ];
  }
}
