import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/utils/cool_navigate.dart';
import 'package:todo_win/utils/info_exception.dart';

class AlertCollection extends StatefulWidget {
  const AlertCollection({
    Key? key,
  }) : super(key: key);

  @override
  _AlertCollectionState createState() => _AlertCollectionState();
}

class _AlertCollectionState extends State<AlertCollection> {
  late TextEditingController textEditingController;
  late SettingsStore settingsStore;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    settingsStore = sl<SettingsStore>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    settingsStore.isDateRegister = false;
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
                        'Criar nova\nlista de tarefas',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    value: settingsStore.isDateRegister,
                    onChanged: (value) => settingsStore.setDateRegister(value!),
                    title: const Text(
                      'Registrar data',
                    ),
                  ),
                  Container(
                    padding: AppEdgeInsets.tsd,
                    child: TextField(
                      controller: textEditingController,
                      onChanged: settingsStore.setCollectionName,
                      keyboardType: TextInputType.text,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(
                          FocusNode(),
                        );
                      },
                      decoration: const InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: AppTextStyles.labelStyle,
                        hintText: 'Digite aqui o nome da lista',
                      ),
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
                onTap: () async => _createCollection(),
                child: Container(
                  padding: AppEdgeInsets.sdAll,
                  child: Padding(
                    padding: AppEdgeInsets.hmd,
                    child: Text(
                      'Criar',
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

  Future<void> _createCollection() async {
    if (!settingsStore.isDateRegister) {
      if (textEditingController.text.isEmpty) {
        InfoException.showInfoException(
          context: context,
          message: 'A descrição está vazia!!!',
          image: AppImages.emojiDesc,
        );
        return;
      }
    }
    await settingsStore.setCollection(
      context: context,
      callbackSucess: () {
        coolNavigate.goBack();
      },
    );
  }
}
