import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/app/name_route.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/utils/cool_navigate.dart';

part 'splash.store.g.dart';

class SplashStore = SplashBase with _$SplashStore;

abstract class SplashBase with Store {
  @action
  Future<void> dismissSplashScreen(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 4),
    );

    try {
      await sl<SettingsStore>().getCollections();
    } catch (_) {}

    coolNavigate.removeUntil(NameRoute.home);
  }
}
