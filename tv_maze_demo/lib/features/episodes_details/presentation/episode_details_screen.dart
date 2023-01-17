import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/models/episode_model.dart';
import 'package:tv_maze_demo/core/constants/app_colors.dart';
import 'package:tv_maze_demo/core/constants/app_styles.dart';
import 'package:tv_maze_demo/core/formatters/app_formatter.dart';
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
            _buildImageCover(),
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
              subtitle: AppFormatter.toPlainText(
                  episodeModel.summary ?? "No Summary available"),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }

  Hero _buildImageCover() {
    return Hero(
        tag: episodeModel.id ?? '',
        child: Image.network(
          episodeModel.image ?? "",
          errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/images/placeholder.png",
                height: 200, width: double.infinity, fit: BoxFit.scaleDown);
          },
        ));
  }

  Row _buildEpisodeSeason() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              "Episode ",
              style: AppStyles.titleMedium(AppColors.secundary),
            ),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              episodeModel.number.toString(),
              style: AppStyles.titleMedium(AppColors.primary),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Season ",
              style: AppStyles.titleMedium(AppColors.secundary),
            ),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              episodeModel.season.toString(),
              style: AppStyles.titleMedium(AppColors.primary),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Duration ",
              style: AppStyles.titleMedium(AppColors.secundary),
            ),
            const SizedBox(
              width: 1,
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                "${episodeModel.runtime} minutes",
                style: AppStyles.titleMedium(AppColors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
