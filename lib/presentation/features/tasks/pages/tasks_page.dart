import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/features/tasks/widgets/header_insert.dart';
import 'package:todo_win/presentation/features/tasks/widgets/list_tasks.dart';
import 'package:todo_win/presentation/features/tasks/widgets/list_tasks_archived.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/widgets/header/base_header.dart';
import 'package:todo_win/presentation/shared/widgets/scaffold/scaffold_primary.dart';
import 'package:todo_win/utils/cool_navigate.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late SettingsStore settingsStore;
  @override
  void initState() {
    settingsStore = sl<SettingsStore>();
    settingsStore.isArchiveList = false;
    super.initState();
  }

  @override
  void dispose() {
    settingsStore.selectedTasks = null;
    settingsStore.isArchiveList = false;
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    settingsStore = sl<SettingsStore>();
    await settingsStore.getTasks();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            _shouldReturn();
            return false;
          },
          child: ScaffoldPrimary(
            isLoading: settingsStore.isLoading,
            title:
                settingsStore.isArchiveList ? 'Tarefas Arquivadas' : 'Tarefas',
            header: Visibility(
              visible: !settingsStore.isArchiveList,
              child: const HeaderInsert(),
            ),
            isAction: true,
            widgetAction: IconButton(
              icon: Icon(
                Icons.archive,
                color: settingsStore.isArchiveList
                    ? Colors.orangeAccent[700]
                    : Colors.white,
              ),
              onPressed: () async => _archiveNavigate(),
            ),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: settingsStore.isArchiveList &&
                        settingsStore.listTasksArchived.isNotEmpty,
                    child: const Padding(
                      padding: AppEdgeInsets.sdAll,
                      child: BaseHeader(
                        children: [
                          TextSpan(
                            text: 'Lista de tarefas ',
                          ),
                          TextSpan(
                            text: 'arquivadas.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !settingsStore.isArchiveList,
                    child: const ListTasks(),
                  ),
                  Visibility(
                    visible: settingsStore.isArchiveList,
                    child: const ListTasksArchived(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _archiveNavigate() async {
    if (settingsStore.isArchiveList) {
      settingsStore.setIsArchiveList(false);
    } else {
      settingsStore.setIsArchiveList(true);
    }
    if (settingsStore.listTasks.isNotEmpty) {
      await settingsStore.getTasks();
    }
  }

  void _shouldReturn() {
    if (settingsStore.isArchiveList) {
      settingsStore.isArchiveList = false;
      return;
    }
    coolNavigate.goBack();
  }
}
