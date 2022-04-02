import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/utils/cool_navigate.dart';
import 'package:todo_win/utils/info_exception.dart';

class SimpleFormAlert extends StatefulWidget {
  final String descriptionOld;
  const SimpleFormAlert({
    Key? key,
    required this.descriptionOld,
  }) : super(key: key);

  @override
  _SimpleFormAlertState createState() => _SimpleFormAlertState();
}

class _SimpleFormAlertState extends State<SimpleFormAlert> {
  late TextEditingController textEditingController;
  late SettingsStore settingsStore;

  @override
  void initState() {
    settingsStore = sl<SettingsStore>();
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          backgroundColor: AppColors.white,
          content: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: SizedBox(
                      child: Text(
                        'Atualizar tarefa',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  AppSpacing.sm,
                  Text(
                    'Descrição atual: ${widget.descriptionOld}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    padding: AppEdgeInsets.tsd,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: settingsStore.editDescriptionTask,
                      keyboardType: TextInputType.text,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: AppTextStyles.labelStyle,
                        hintText: 'Digite aqui a descrição',
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Visibility(
              visible: settingsStore.isLoading,
              child: const CircularProgressIndicator(),
            ),
            Visibility(
              visible: !settingsStore.isLoading,
              child: InkWell(
                onTap: () {
                  coolNavigate.goBack();
                },
                child: Container(
                  padding: AppEdgeInsets.sdAll,
                  decoration: AppInputBorder.borderRadius.copyWith(
                    color: AppColors.grey3,
                  ),
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
              visible: !settingsStore.isLoading,
              child: InkWell(
                onTap: () async => _editTask(),
                child: Container(
                  padding: AppEdgeInsets.sdAll,
                  child: Padding(
                    padding: AppEdgeInsets.hmd,
                    child: Text(
                      'Continuar',
                      style: AppTextStyles.titleButton.copyWith(
                        color: AppColors.primaryColor,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> _editTask() async {
    if (textEditingController.text.isEmpty) {
      InfoException.showInfoException(
        context: context,
        message: 'A descrição está vazia!!!',
        image: AppImages.emojiNeutro,
      );
      return;
    }
    await settingsStore.updateTasks(
      context: context,
      callBackSucess: () => coolNavigate.goBack(),
    );
  }
}
