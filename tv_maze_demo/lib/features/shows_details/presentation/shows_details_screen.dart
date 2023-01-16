import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/cubit/shows_details_cubit.dart';

class ShowsDetailsScreen extends StatefulWidget {
  const ShowsDetailsScreen({super.key});

  @override
  State<ShowsDetailsScreen> createState() => _ShowsDetailsScreenState();
}

class _ShowsDetailsScreenState extends State<ShowsDetailsScreen> {
  late ShowsDetailsCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<ShowsDetailsCubit>(context);
    _cubit.getShow();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowsDetailsCubit, ShowsDetailsState>(
      builder: ((context, state) {
        if (state is ShowsDetailsLoading) {
          return const CircularProgressIndicator.adaptive();
        } else if (state is ShowsDetailsSucesss) {
          return Container(color: Colors.green);
        } else {
          return Container();
        }
      }),
    );
  }
}
