import 'package:flutter/material.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/splash/mobx/splash.store.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/utils/layout.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  var _opacity = 0.0;
  Future<void> showLogo() async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    setState(() => _opacity = 1.0);
  }

  @override
  void initState() {
    _init();

    sl<SplashStore>().dismissSplashScreen(context);
    super.initState();
  }

  void _init() async {
    await showLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Layout.getSize(context).height,
      width: Layout.getSize(context).width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue[900]!,
            Colors.green,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            width: MediaQuery.of(context).size.width / 1.3,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: Image.asset(AppImages.logo),
            ),
          ),
        ],
      ),
    );
  }
}
