import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/constants/app_styles.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const TitleSubtitleWidget({Key? key, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title ?? "",
                  textAlign: TextAlign.start,
                  style: AppStyles.titleLarge(
                    AppColors.primary,
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: subtitle?.isNotEmpty ?? false,
          child: Row(
            children: [
              Expanded(
                  child: Text(subtitle ?? "",
                      textAlign: TextAlign.start,
                      style: AppStyles.labelSmall(
                        AppColors.primary,
                      )))
            ],
          ),
        ),
      ],
    );
  }
}
