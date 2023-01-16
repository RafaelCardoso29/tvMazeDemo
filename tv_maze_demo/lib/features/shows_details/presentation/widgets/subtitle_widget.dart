import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/constants/app_colors.dart';
import 'package:tv_maze_demo/core/constants/app_styles.dart';

class SubtitleWidget extends StatelessWidget {
  final String? subtitle;
  final EdgeInsetsGeometry padding;
  const SubtitleWidget(
      {Key? key,
      required this.subtitle,
      this.padding = const EdgeInsets.symmetric(horizontal: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: padding,
        sliver: SliverToBoxAdapter(
            child: Row(children: [
          Expanded(
            child: Text(
              subtitle ?? "",
              textAlign: TextAlign.start,
              style: AppStyles.subtitleMedium(
                AppColors.primary,
              ),
            ),
          )
        ])));
  }
}
