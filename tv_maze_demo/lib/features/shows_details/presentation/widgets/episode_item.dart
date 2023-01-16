import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/network/models/episode_model.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/constants/app_routes.dart';
import 'package:tv_maze_demo/core/utils/constants/app_styles.dart';

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
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Hero(
                  tag: episodeModel.id ?? '',
                  child: SizedBox(
                    height: 70,
                    width: 90,
                    child: Image.network(
                      episodeModel.image ?? "",
                      fit: BoxFit.cover,
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
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
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
