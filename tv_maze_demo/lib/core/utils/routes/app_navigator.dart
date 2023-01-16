import 'package:flutter/material.dart';
import 'package:tv_maze_demo/core/utils/constants/app_routes.dart';
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

      case AppRoutes.episodesListScreen:
        var model = (args as dynamic);
        return MaterialPageRoute(
          builder: (_) => const ShowsDetailsScreen(),
          settings: settings,
        );

      case AppRoutes.episodesDetailsScreen:
        var model = (args as dynamic);
        return MaterialPageRoute(
          builder: (_) => const ShowsDetailsScreen(),
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
