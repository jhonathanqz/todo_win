import 'package:flutter/material.dart';
import 'package:todo_win/app/name_route.dart';
import 'package:todo_win/presentation/features/home/pages/home_page.dart';
import 'package:todo_win/presentation/features/splash/pages/splash_screen_page.dart';
import 'package:todo_win/presentation/features/tasks/pages/tasks_page.dart';

class AppModule {
  static String get initialRoute => NameRoute.splash;
  static Map<String, Widget Function(BuildContext)> routes = {
    NameRoute.splash: (_) => const SplashScreenPage(),
    NameRoute.home: (_) => const HomePage(),
    NameRoute.tasks: (_) => const TasksPage(),
  };

  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
