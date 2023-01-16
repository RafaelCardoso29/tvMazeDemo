import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze_demo/bloc_dependecy.dart';
import 'package:tv_maze_demo/core/utils/constants/app_colors.dart';
import 'package:tv_maze_demo/core/utils/routes/app_navigator.dart';

void main() {
  runApp(const GoogleBooksDemo());
}

class GoogleBooksDemo extends StatelessWidget {
  const GoogleBooksDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocDependency.setBlocs(),
      child: MaterialApp(
        title: 'Tv Maze demo',
        home: const SplashScreen(),
        onGenerateRoute: AppNavigator.generateRoute,
        theme: ThemeData(
            backgroundColor: AppColors.backgroundColor,
            primaryColor: AppColors.primary),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () =>
            Navigator.pushReplacementNamed(context, AppNavigator.initialRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            height: 40,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}
