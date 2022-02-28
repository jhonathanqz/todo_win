import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/helpers/dialog_helper.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/widgets/alert/alert_info_error.dart';
import 'package:todo_win/utils/cool_navigate.dart';

class InfoException {
  static void showInfoException({
    required BuildContext context,
    required String message,
    required String image,
    String title = 'Atenção!',
    Color backgroundColor = AppColors.white,
  }) {
    DialogHelper.open(
      context: context,
      content: AlertInfoError(
        title: title,
        message: message,
        function: () => coolNavigate.goBack(),
        image: image,
        isBackButton: true,
        textButton: 'Ok',
        colorButton: AppColors.primaryColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
