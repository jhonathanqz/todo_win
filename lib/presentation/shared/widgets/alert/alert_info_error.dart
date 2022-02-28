import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_size.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/utils/layout.dart';

@immutable
class AlertInfoError extends StatelessWidget {
  final String message;
  final Function() function;
  final String? textButton;
  final String title;
  final bool isBackButton;
  final String image;
  final Color colorButton;
  final Color backgroundColor;
  const AlertInfoError({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.isBackButton = false,
    required this.colorButton,
    required this.image,
    this.backgroundColor = AppColors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: backgroundColor,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Layout.getSize(context).width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: AppSize.size56,
                    width: AppSize.size56,
                    child: Image.asset(image),
                  ),
                ),
                AppSpacing.sm,
                Center(
                  child: Text(
                    title,
                    style: AppTextStyles.titleBold.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Container(
                    padding: AppEdgeInsets.tmd,
                    child: Text(
                      message,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        Visibility(
          visible: true,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.grey3,
              ),
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
