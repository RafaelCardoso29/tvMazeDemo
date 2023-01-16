import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/network/models/episode_model.dart';
import 'package:tv_maze_demo/core/utils/constants/app_routes.dart';
import 'package:tv_maze_demo/features/episodes_details/presentation/episode_details_screen.dart';
import 'package:tv_maze_demo/features/shows_details/presentation/shows_details_screen.dart';

class AppNavigator {
  static const String initialRoute = AppRoutes.showsDetailsScreen;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.showsDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const ShowsDetailsScreen(),
          settings: settings,
        );

      case AppRoutes.episodeDetailsScreen:
        var model = (args as EpisodeModel);
        return MaterialPageRoute(
          builder: (_) => EpisodeDetailsScreen(
            episodeModel: model,
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShowsDetailsScreen(),
        );
    }
  }
}
