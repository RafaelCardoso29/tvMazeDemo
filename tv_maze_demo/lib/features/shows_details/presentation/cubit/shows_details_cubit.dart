import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tv_maze_demo/core/models/show_model.dart';
import 'package:tv_maze_demo/features/shows_details/data/shows_details_repository.dart';

part 'shows_details_state.dart';

class ShowsDetailsCubit extends Cubit<ShowsDetailsState> {
  final ShowsDetailsRepository _repository;

  ShowsDetailsCubit(this._repository) : super(ShowsDetailsInitial());

  void getShow() async {
    emit(ShowsDetailsLoading());
    try {
      var response = await _repository.getShow();

      emit(ShowsDetailsSucesss(response));
    } catch (e) {
      emit(ShowsDetailsError(e.toString()));
    }
  }
}
