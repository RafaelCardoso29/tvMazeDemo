import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tv_maze_demo/core/network/models/episode_model.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/constants/app_routes.dart';
import 'package:tv_maze_demo/core/utils/constants/app_styles.dart';
import 'package:tv_maze_demo/core/utils/helpers/convert_helper.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/cubit/shows_details_cubit.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/widgets/episode_item.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/widgets/subtitle_widget.dart';

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
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: _buildAppBar(state.showModel.image ?? ""),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    _buildTitle(state),
                    const SizedBox(height: 10),
                    _buildGenres(state.showModel.genres ?? []),
                    const SizedBox(height: 30),
                    const SubtitleWidget(subtitle: "About "),
                    const SizedBox(height: 10),
                    _buildSummary(state),
                    const SizedBox(height: 30),
                    const SubtitleWidget(subtitle: "Episodes "),
                    const SizedBox(height: 10),
                    _buildEpisodeList(state.showModel.episodes ?? [])
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Row _buildSummary(ShowsDetailsSucesss state) {
    return Row(
      children: [
        Expanded(
          child: Text(
            ConvertHelper.toPlainText(state.showModel.summary),
            textAlign: TextAlign.start,
            style: AppStyles.bodyMedium(
              AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  _buildAppBar(String? image) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(230),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  image ?? "",
                ),
                fit: BoxFit.scaleDown),
          )),
    );
  }

  Row _buildTitle(ShowsDetailsSucesss state) {
    return Row(
      children: [
        Expanded(
          child: Text(state.showModel.name ?? "",
              textAlign: TextAlign.left,
              style: AppStyles.titleLarge(
                AppColors.primary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Row _buildGenres(List<String> list) {
    List<Widget> genreChips = [];
    for (var element in list) {
      genreChips.add(
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            element,
            style: AppStyles.labelMedium(
              AppColors.primary,
            ),
          ),
        ),
      );

      genreChips.add(const SizedBox(
        width: 10,
      ));
    }
    return Row(
      children: genreChips,
    );
  }

  ListView _buildEpisodeList(List<EpisodeModel> episodes) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return EpisodeItem(context: context, episodeModel: episodes[index]);
        }),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 20,
          );
        }),
        itemCount: episodes.length);
  }
}
