import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/presentation/shared/widgets/loading/color_loader.dart';
import 'package:todo_win/utils/layout.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool isMessage;

  const Loading({
    Key? key,
    required this.isLoading,
    required this.child,
    this.isMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        SizedBox(
          height: Layout.getSize(context).height,
          width: Layout.getSize(context).width,
          child: Visibility(
            visible: isLoading,
            child: Container(
              width: double.infinity,
              height: Layout.getSize(context).height,
              color: AppColors.blurredBackground.withOpacity(0.7),
              child: isMessage
                  ? Center(
                      child: SizedBox(
                        height: 70,
                        child: Column(
                          children: [
                            Text(
                              'Processando...',
                              style: AppTextStyles.heading.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            AppSpacing.md,
                            const ColorLoader(
                              dotOneColor: AppColors.white,
                              dotTwoColor: AppColors.white,
                              dotThreeColor: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                        height: 50,
                        child: ColorLoader(
                          dotOneColor: AppColors.white,
                          dotTwoColor: AppColors.white,
                          dotThreeColor: AppColors.white,
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
