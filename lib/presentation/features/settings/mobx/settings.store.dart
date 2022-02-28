import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/use_cases/get_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/set_tasks_use_case.dart';
import 'package:todo_win/presentation/shared/helpers/snack_helper.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';

part 'settings.store.g.dart';

class SettingsStore = SettingsBase with _$SettingsStore;

abstract class SettingsBase with Store {
  final GetTasksUseCase getTasksUseCase;
  final SetTasksUseCase setTasksUseCase;

  SettingsBase({
    required this.getTasksUseCase,
    required this.setTasksUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  Tasks tasks = Tasks();

  @observable
  bool error = false;

  @observable
  bool isLoggedAuto = true;

  @action
  Future<Tasks> getTasks() async {
    try {
      final tasksBD = await getTasksUseCase();
      tasks = tasksBD;
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> setTasks({
    required BuildContext context,
    required Function() callbackSucess,
  }) async {
    try {
      isLoading = true;
      await setTasksUseCase(
        Tasks(
          description: tasks.description,
          isArchived: tasks.isArchived,
          isCompleted: tasks.isCompleted,
          collectionName: tasks.collectionName,
        ),
      );
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      SnackHelper.showSnackInformation(
        'Erro ao inserir tarefa no banco de dados.',
        AppColors.redInformation,
        context,
      );
      rethrow;
    }
  }
}
