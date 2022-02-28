import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle titleBold = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 20,
  );

  static const TextStyle titleButton = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static const TextStyle textSnackInformation = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
    fontSize: 13,
  );

  static const TextStyle headingBold = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle simpleStyle = TextStyle(
    color: AppColors.white,
    fontSize: 14,
  );

  static const TextStyle lighStyleBlack = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontSize: 14,
  );

  static const TextStyle simpleDarkStyle = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 14,
  );
}
