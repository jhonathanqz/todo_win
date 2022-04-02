import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_text_styles.dart';
import 'package:todo_win/utils/info_exception.dart';

class HeaderInsert extends StatefulWidget {
  const HeaderInsert({Key? key}) : super(key: key);

  @override
  _HeaderInsertState createState() => _HeaderInsertState();
}

class _HeaderInsertState extends State<HeaderInsert> {
  late TextEditingController inputController;
  late SettingsStore settingsStore;

  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    settingsStore = sl<SettingsStore>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    inputController.clear();
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: AppEdgeInsets.sdAll,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: inputController,
                  onChanged: settingsStore.setDescriptionTask,
                  decoration: InputDecoration(
                    labelText: 'Inserir tarefa:',
                    labelStyle: AppTextStyles.labelStyle,
                    hintText: 'Digite aqui uma nova tarefa',
                    suffixIcon: InkWell(
                      child: Container(
                        decoration: AppInputBorder.borderRadius.copyWith(
                          color: AppColors.primaryColor,
                          //gradient: LinearGradient(
                          //  begin: Alignment.topRight,
                          //  end: Alignment.bottomLeft,
                          //  colors: [
                          //    Colors.green[800]!,
                          //    Colors.greenAccent[400]!,
                          //  ],
                          //),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.black,
                        ),
                      ),
                      onTap: () async => _insertTask(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _insertTask() async {
    if (inputController.text.trim() == '' || inputController.text.isEmpty) {
      InfoException.showInfoException(
        context: context,
        message: 'Digite algo antes de inserir por favor! :-)',
        image: AppImages.emojiNeutro,
      );
      FocusScope.of(context).requestFocus(
        FocusNode(),
      );
      return;
    }
    await settingsStore.setTasks(
      context: context,
      callbackSucess: () {
        inputController.text = '';
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
    );
  }
}
