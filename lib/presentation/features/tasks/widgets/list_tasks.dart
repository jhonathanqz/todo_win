import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/shared/helpers/dialog_helper.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_edge_insets.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/presentation/shared/style/app_input_border.dart';
import 'package:todo_win/presentation/shared/style/app_spacing.dart';
import 'package:todo_win/presentation/shared/widgets/alert/alert_info.dart';
import 'package:todo_win/presentation/shared/widgets/alert/simple_alert_form.dart';
import 'package:todo_win/presentation/shared/widgets/empty/list_empty.dart';
import 'package:todo_win/presentation/shared/widgets/refresh/refresh_widget.dart';
import 'package:todo_win/string_extension.dart';
import 'package:todo_win/utils/cool_navigate.dart';

class ListTasks extends StatefulWidget {
  const ListTasks({Key? key}) : super(key: key);

  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  late SettingsStore settingsStore;
  final _keyRefresh = GlobalKey<RefreshIndicatorState>();

  @override
  void didChangeDependencies() {
    settingsStore = sl<SettingsStore>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return settingsStore.isTasksContain() <= 0
            ? const ListEmpty(
                isEnabledImage: true,
                message: 'Nenhuma tarefa foi encontrada',
              )
            : Expanded(
                child: RefreshWidget(
                  keyRefresh: _keyRefresh,
                  onRefresh: refreshList,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: settingsStore.listTasksNotArchived.length,
                    itemBuilder: (context, index) {
                      final task = settingsStore.listTasksNotArchived[index];
                      return Padding(
                        padding: AppEdgeInsets.tsd,
                        child: Slidable(
                          key: Key(task.id.toString()),
                          endActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async => _archiveTask(task),
                                  child: Container(
                                    margin: AppEdgeInsets.tsd,
                                    padding: AppEdgeInsets.sdAll,
                                    decoration: AppInputBorder.borderRadius
                                        .copyWith(color: Colors.purple),
                                    child: const Center(
                                      child: Icon(
                                        Icons.archive,
                                        color: AppColors.white,
                                        size: 27,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AppSpacing.minW,
                              Expanded(
                                child: InkWell(
                                  onTap: () async => _deleteTask(task),
                                  child: Container(
                                    margin: AppEdgeInsets.tsd,
                                    padding: AppEdgeInsets.sdAll,
                                    decoration: AppInputBorder.borderRadius
                                        .copyWith(color: AppColors.redColor),
                                    child: const Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.white,
                                        size: 27,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: ListTile(
                            selected: task.isCompleted,
                            selectedTileColor: Colors.grey[300],
                            tileColor: Colors.white,
                            title: Text(
                              task.description.capitalizeFirstOfEach,
                              style: const TextStyle(
                                color: AppColors.black,
                              ),
                            ),
                            leading: Checkbox(
                              visualDensity: VisualDensity.compact,
                              //groupValue: settingsStore.isLoggedAuto,
                              activeColor: AppColors.greenInformation,
                              value: task.isCompleted,
                              onChanged: (v) async => _completeTask(v!, task),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: task.isCompleted
                                    ? Colors.grey[800]
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                settingsStore.selectedTasks = task;
                                DialogHelper.open(
                                  context: context,
                                  content: SimpleFormAlert(
                                    descriptionOld: task.description,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }

  Future<void> _archiveTask(Tasks task) async {
    settingsStore.selectedTasks = task;
    await settingsStore.archiveTasks(
      context: context,
    );
  }

  Future<void> _deleteTask(Tasks task) async {
    DialogHelper.open(
      context: context,
      content: AlertInfo(
        isDualButton: true,
        title: 'Excluir',
        message: 'Deseja realmente excluir a tarefa?',
        function: () async {
          await settingsStore.deleteTask(
            context: context,
            taskId: task.id,
          );
          coolNavigate.goBack();
        },
        image: AppImages.delete,
        textButton: 'Sim',
      ),
    );
  }

  Future<void> _completeTask(bool v, Tasks task) async {
    settingsStore.selectedTasks = task;
    settingsStore.isCompletedUpdate(v);
    await settingsStore.updateTasks(
      context: context,
      callBackSucess: () {},
    );
  }

  Future<void> refreshList() async {
    await Future.delayed(const Duration(seconds: 1));
    await settingsStore.getTasks();
  }
}
