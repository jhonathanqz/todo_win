import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_size.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/utils/cool_navigate.dart';
import 'package:todo_win/utils/layout.dart';

@immutable
class AlertInfo extends StatelessWidget {
  final String message;
  final Function() function;
  final String? textButton;
  final String title;
  final bool isDualButton;
  final String image;
  const AlertInfo({
    Key? key,
    required this.title,
    required this.message,
    required this.function,
    this.textButton = 'Finalizar',
    this.isDualButton = false,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: AppInputBorder.borderRadiusAll,
      ),
      elevation: 2,
      backgroundColor: AppColors.white,
      title: SizedBox(
        width: Layout.getSize(context).width / 2,
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: AppSize.size75,
                width: AppSize.size75,
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
            Container(
              padding: AppEdgeInsets.tmd,
              child: Text(
                message,
                style: AppTextStyles.title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Visibility(
          visible: isDualButton,
          child: InkWell(
            onTap: () {
              coolNavigate.goBack();
            },
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: const Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  'Voltar',
                  style: AppTextStyles.titleButton,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isDualButton,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              decoration: AppInputBorder.borderRadius.copyWith(
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isDualButton,
          child: InkWell(
            onTap: function,
            child: Container(
              padding: AppEdgeInsets.sdAll,
              child: Padding(
                padding: AppEdgeInsets.hmd,
                child: Text(
                  textButton!,
                  style: AppTextStyles.titleButton.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
