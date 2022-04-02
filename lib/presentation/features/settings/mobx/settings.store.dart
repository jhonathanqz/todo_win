import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/use_cases/delete_collection_use_case.dart';
import 'package:todo_win/domain/use_cases/delete_task_use_case.dart';
import 'package:todo_win/domain/use_cases/delete_tasks_from_collection_use_case.dart';
import 'package:todo_win/domain/use_cases/get_collections_use_case.dart';
import 'package:todo_win/domain/use_cases/get_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/set_collections_use_case.dart';
import 'package:todo_win/domain/use_cases/set_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/update_tasks_use_case.dart';
import 'package:todo_win/presentation/shared/helpers/snack_helper.dart';
import 'package:todo_win/presentation/shared/style/app_colors.dart';
import 'package:todo_win/presentation/shared/style/app_images.dart';
import 'package:todo_win/utils/info_exception.dart';

part 'settings.store.g.dart';

class SettingsStore = SettingsBase with _$SettingsStore;

abstract class SettingsBase with Store {
  final GetTasksUseCase getTasksUseCase;
  final SetTasksUseCase setTasksUseCase;
  final UpdateTasksUseCase updateTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final DeleteTasksFromCollectionUseCase deleteTasksFromCollectionUseCase;
  final DeleteCollectionUseCase deleteCollectionUseCase;
  final GetCollectionsUseCase getCollectionsUseCase;
  final SetCollectionsUseCase setCollectionsUseCase;

  SettingsBase({
    required this.getTasksUseCase,
    required this.setTasksUseCase,
    required this.updateTasksUseCase,
    required this.deleteTaskUseCase,
    required this.deleteTasksFromCollectionUseCase,
    required this.deleteCollectionUseCase,
    required this.getCollectionsUseCase,
    required this.setCollectionsUseCase,
  });

  @observable
  bool isLoading = false;

  @observable
  Tasks tasks = Tasks();

  @observable
  Collection? selectedCollection;

  @observable
  List<Collection> listCollection = [];

  @observable
  String createCollectionName = '';

  @observable
  Tasks? selectedTasks;

  @observable
  List<Tasks> listTasks = [];

  @observable
  List<Tasks> listTasksArchived = [];

  @observable
  List<Tasks> listTasksNotArchived = [];

  @observable
  bool error = false;

  @observable
  bool isArchiveList = false;

  @action
  void setIsArchiveList(bool value) {
    isArchiveList = value;
  }

  @observable
  bool isDateRegister = false;

  @action
  void setDateRegister(bool value) {
    isDateRegister = value;
  }

  @action
  void isCompletedUpdate(bool value) =>
      selectedTasks = selectedTasks!.copyWith(isCompleted: value);

  @action
  void editDescriptionTask(String value) =>
      selectedTasks = selectedTasks!.copyWith(description: value);

  @action
  void setDescriptionTask(String value) =>
      tasks = tasks.copyWith(description: value);

  @action
  void setCollectionName(String value) => createCollectionName = value;

  int isArchivedContain() {
    final value =
        listTasks.where((element) => element.isArchived == true).length;
    return value;
  }

  int isTasksContain() {
    final value =
        listTasks.where((element) => element.isArchived == false).length;
    return value;
  }

  @action
  Future<List<Tasks>> getTasks() async {
    try {
      isLoading = true;
      wipeListTasks();
      final tasksBD = await getTasksUseCase(selectedCollection!.id);
      listTasks = tasksBD;
      listTasksArchived =
          listTasks.where((element) => element.isArchived == true).toList();
      listTasksNotArchived =
          listTasks.where((element) => element.isArchived == false).toList();
      isLoading = false;
      wipeSelectedTask();
      return listTasks;
    } catch (e) {
      wipeListTasks();
      isLoading = false;
      wipeSelectedTask();
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
          collectionId: selectedCollection!.id,
        ),
      );
      await getTasks();
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao inserir tarefa no banco de dados.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  Future<void> updateTasks({
    required BuildContext context,
    required Function() callBackSucess,
  }) async {
    try {
      isLoading = true;
      await updateTasksUseCase(
        Tasks(
          id: selectedTasks!.id,
          description: selectedTasks!.description,
          isArchived: selectedTasks!.isArchived,
          isCompleted: selectedTasks!.isCompleted,
          collectionId: selectedTasks!.collectionId,
        ),
      );
      await getTasks();
      isLoading = false;
      callBackSucess();
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao atualizar tarefa.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  Future<void> deleteTask({
    required BuildContext context,
    required int taskId,
  }) async {
    try {
      isLoading = true;
      await deleteTaskUseCase(
        taskId,
      );
      SnackHelper.showSnackInformation(
        'Tarefa excluída.',
        AppColors.appBarColor,
        context,
      );
      if (listTasks.length > 1) {
        await getTasks();
      } else {
        listTasks = [];
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao apagar tarefa.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  Future<void> deleteTaskFromCollection({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      await getTasks();
      await deleteTasksFromCollectionUseCase(
        selectedCollection!.id,
      );
      isLoading = false;
    } catch (e) {
      selectedCollection = null;
      wipeListTasks();
      rethrow;
    }
  }

  @action
  Future<void> deleteCollection({
    required BuildContext context,
    required int collectionId,
    required Function() callBackSucess,
  }) async {
    try {
      isLoading = true;

      await deleteCollectionUseCase(
        collectionId,
      );

      if (listCollection.length > 1) {
        await getCollections();
      } else {
        _wipeCollectionList();
      }
      isLoading = false;
      callBackSucess();
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao apagar lista.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  Future<void> archiveTasks({
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      await updateTasksUseCase(
        Tasks(
          id: selectedTasks!.id,
          description: selectedTasks!.description,
          isArchived: selectedTasks!.isArchived ? false : true,
          isCompleted: selectedTasks!.isCompleted,
          collectionId: selectedTasks!.collectionId,
        ),
      );

      SnackHelper.showSnackInformation(
        selectedTasks!.isArchived
            ? 'Tarefa desarquivada.'
            : 'Tarefa arquivada com sucesso!',
        AppColors.greenInformation,
        context,
      );

      await getTasks();

      isLoading = false;
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao arquivar tarefa.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  Future<List<Collection>> getCollections() async {
    try {
      isLoading = true;
      final collectionsBD = await getCollectionsUseCase();
      listCollection = collectionsBD;

      isLoading = false;
      return listCollection;
    } catch (e) {
      _wipeCollectionList();
      isLoading = false;
      rethrow;
    }
  }

  @action
  Future<void> setCollection({
    required BuildContext context,
    required Function() callbackSucess,
  }) async {
    try {
      if (isDateRegister) {
        var date = DateTime.now();
        var dateEdit = DateFormat('dd/MM/yyyy').format(date);
        if (createCollectionName.trim() != '') {
          setCollectionName(dateEdit + ' - ' + createCollectionName);
        } else {
          setCollectionName(dateEdit);
        }
      }
      if (createCollectionName.trim() == '') {
        InfoException.showInfoException(
          context: context,
          message: 'O nome informado para a lista é inválido.',
          image: AppImages.emojiNeutro,
        );
        return;
      }
      isLoading = true;
      await setCollectionsUseCase(
        Collection(
          collectionName: createCollectionName,
        ),
      );

      await getCollections();
      setCollectionName('');
      isLoading = false;
      callbackSucess();
    } catch (e) {
      isLoading = false;
      InfoException.showInfoException(
        context: context,
        message: 'Erro ao criar lista de tarefas.',
        image: AppImages.emojiError,
      );
      rethrow;
    }
  }

  @action
  void wipeSelectedTask() {
    selectedTasks = null;
  }

  @action
  void wipeListTasks() {
    listTasks = [];
    listTasksArchived = [];
    listTasksNotArchived = [];
  }

  @action
  void _wipeCollectionList() {
    listCollection = [];
  }
}
