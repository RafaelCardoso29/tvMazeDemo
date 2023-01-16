import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/network/models/episode_model.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/constants/app_styles.dart';
import 'package:tv_maze_demo/core/utils/helpers/convert_helper.dart';
import 'package:tv_maze_demo/features/episodes_details/presentation/widgets/title_subtitle_widget.dart';

class EpisodeDetailsScreen extends StatelessWidget {
  final EpisodeModel episodeModel;
  const EpisodeDetailsScreen({Key? key, required this.episodeModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Episode details",
            textAlign: TextAlign.center,
            style: AppStyles.titleMedium(
              AppColors.primary,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Hero(
                tag: episodeModel.id ?? '',
                child: Image.network(episodeModel.image ?? "")),
            const SizedBox(height: 20),
            TitleSubtitleWidget(
              title: episodeModel.name ?? "",
              subtitle: "",
            ),
            _buildEpisodeSeason(),
            const SizedBox(
              height: 20,
            ),
            TitleSubtitleWidget(
              title: "Synopsis",
              subtitle: ConvertHelper.toPlainText(episodeModel.summary),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Row _buildEpisodeSeason() {
    return Row(
      children: [
        Text(
          "Episode ",
          style: AppStyles.titleMedium(AppColors.secundary),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          episodeModel.number.toString(),
          style: AppStyles.titleMedium(AppColors.primary),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          "Season ",
          style: AppStyles.titleMedium(AppColors.secundary),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          episodeModel.season.toString(),
          style: AppStyles.titleMedium(AppColors.primary),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          "Duration ",
          style: AppStyles.titleMedium(AppColors.secundary),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "${episodeModel.runtime} minutes",
          style: AppStyles.titleMedium(AppColors.primary),
        ),
      ],
    );
  }
}
