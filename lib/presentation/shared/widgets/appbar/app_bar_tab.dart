import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';

@immutable
class AppBarTab extends PreferredSize {
  AppBarTab({
    Key? key,
    required String title,
    Widget? leading,
    Function? leadingOnTap,
    BuildContext? context,
    required Widget widget,
    PreferredSizeWidget? bottom,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            backgroundColor: AppColors.appBarColor,
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            leading: leading,
            actions: [widget],
            bottom: bottom,
          ),
        );
}
