import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    Key? key,
    required this.child,
    required this.keyRefresh,
    required this.onRefresh,
  }) : super(key: key);
  final GlobalKey<RefreshIndicatorState> keyRefresh;
  final Widget child;
  final Future Function() onRefresh;

  @override
  Widget build(BuildContext context) =>
      Platform.isAndroid ? buildAndroidList() : buildIOSList();

  Widget buildAndroidList() => RefreshIndicator(
        key: keyRefresh,
        onRefresh: onRefresh,
        child: child,
        color: AppColors.primaryColor,
      );

  Widget buildIOSList() => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: onRefresh),
          SliverToBoxAdapter(child: child),
        ],
      );
}
