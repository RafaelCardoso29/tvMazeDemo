import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/constants/app_styles.dart';

class SubtitleWidget extends StatelessWidget {
  final String? subtitle;
  const SubtitleWidget({Key? key, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Text(
          subtitle ?? "",
          textAlign: TextAlign.start,
          style: AppStyles.subtitleMedium(
            AppColors.primary,
          ),
        ),
      )
    ]);
  }
}
