import 'package:flutter/material.dart';
import 'package:todo_win/app/app_module.dart';
import 'package:todo_win/utils/cool_navigate.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDoWin',
      theme: AppModule.theme,
      initialRoute: AppModule.initialRoute,
      navigatorKey: NavigationService.navigationKey,
      routes: AppModule.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
