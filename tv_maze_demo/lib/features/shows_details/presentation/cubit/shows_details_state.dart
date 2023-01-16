part of 'shows_details_cubit.dart';

@immutable
abstract class ShowsDetailsState {}

class ShowsDetailsInitial extends ShowsDetailsState {}

class ShowsDetailsLoading extends ShowsDetailsState {}

class ShowsDetailsError extends ShowsDetailsState {
  final String? error;
  ShowsDetailsError(this.error);
}

class ShowsDetailsSucesss extends ShowsDetailsState {
  final ShowModel showModel;
  ShowsDetailsSucesss(this.showModel);
}
