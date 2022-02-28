import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/home/widgets/header_collection.dart';
import 'package:todo_win/presentation/features/home/widgets/list_collections.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/helpers/dialog_helper.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/widgets/alert/alert_collection.dart';
import 'package:todo_win/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:todo_win/utils/info_exception.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SettingsStore settingsStore;

  @override
  void didChangeDependencies() {
    settingsStore = sl<SettingsStore>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ScaffoldPrimary(
          isLoading: settingsStore.isLoading,
          isAction: true,
          widgetAction: IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _info(),
          ),
          title: 'Home',
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              DialogHelper.open(
                context: context,
                content: const AlertCollection(),
              );
            },
            label: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: AppColors.black,
                  size: 27,
                ),
                AppSpacing.minW,
                Text(
                  'Nova Lista',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: settingsStore.listCollection.isNotEmpty,
                  child: const Padding(
                    padding: AppEdgeInsets.hsd,
                    child: HeaderCollection(),
                  ),
                ),
                const Expanded(
                  child: ListCollections(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _info() {
    InfoException.showInfoException(
      context: context,
      title: 'ToDoWin informa:',
      message:
          'Para apagar uma lista ou uma tarefa, apenas deslize o card da direita para a esquerda.\n\nFeito por: Jhonathan Queiroz',
      image: AppImages.info,
    );
  }
}
