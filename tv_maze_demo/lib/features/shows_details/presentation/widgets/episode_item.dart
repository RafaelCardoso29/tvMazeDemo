import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/models/episode_model.dart';
import 'package:tv_maze_demo/core/constants/app_colors.dart';
import 'package:tv_maze_demo/core/routes/app_routes.dart';
import 'package:tv_maze_demo/core/constants/app_styles.dart';

class EpisodeItem extends StatelessWidget {
  final EpisodeModel episodeModel;
  const EpisodeItem(
      {Key? key, required this.context, required this.episodeModel})
      : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.episodeDetailsScreen,
            arguments: episodeModel);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: episodeModel.id ?? '',
                  child: SizedBox(
                    height: 85,
                    width: 122,
                    child: Image.network(
                      episodeModel.image ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(episodeModel.name ?? "",
                            style: AppStyles.labelMedium(
                              AppColors.primary,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text("Episode ${episodeModel.number ?? 00} ",
                            style: AppStyles.labelMedium(
                              AppColors.secundary,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text("${episodeModel.runtime ?? 00} min",
                            style: AppStyles.labelMedium(
                              AppColors.secundary,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
