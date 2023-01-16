part of 'shows_details_cubit.dart';

@immutable
abstract class ShowsDetailsState {}

class ShowsDetailsInitial extends ShowsDetailsState {}

class ShowsDetailsLoading extends ShowsDetailsState {}

class ShowsDetailsSucesss extends ShowsDetailsState {
  final ShowModel showModel;
  ShowsDetailsSucesss(this.showModel);
}
