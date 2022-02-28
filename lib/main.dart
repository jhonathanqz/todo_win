import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_win/app/app.dart';
import 'package:todo_win/app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  setupDependencies();
  //await firebase.init();

  runApp(
    const App(),
  );
}
