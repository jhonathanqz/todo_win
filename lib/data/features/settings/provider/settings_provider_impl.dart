//SitefSettings
import 'package:todo_win/app/injection_container.dart';
import 'package:todo_win/data/features/settings/helper/database_helper.dart';
import 'package:todo_win/data/features/settings/model/collection_settings_model.dart';
import 'package:todo_win/data/features/settings/model/todo_settings_model.dart';
import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/contracts/settings_provider.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';

class SettingsProviderImpl implements SettingsProvider {
  @override
  Future<List<Tasks>> getTasks(int collectionId) async {
    try {
      final settingsModel = await DatabaseHelper.getTasks(collectionId);

      return settingsModel
          .map((e) => Tasks(
                id: e.id!,
                description: e.description,
                isArchived: e.archived == 1 ? true : false,
                isCompleted: e.completed == 1 ? true : false,
                collectionId: e.collectionId,
              ))
          .toList();
    } catch (e) {
      sl<SettingsStore>().listTasks = [];
      rethrow;
    }
  }

  @override
  Future<void> setTasks(Tasks tasks) async {
    try {
      final settingsModel = ToDoSettingsModel(
        description: tasks.description,
        archived: tasks.isArchived == true ? 1 : 0,
        completed: tasks.isCompleted == true ? 1 : 0,
        collectionId: tasks.collectionId,
      );

      await DatabaseHelper.setTasks(settingsModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Collection>> getCollections() async {
    try {
      final settingsModel = await DatabaseHelper.getCollections();

      return settingsModel
          .map((e) => Collection(
                id: e.id!,
                collectionName: e.collectionName,
              ))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setCollections(Collection collection) async {
    try {
      final settingsModel = CollectionSettingsModel(
        collectionName: collection.collectionName,
      );

      await DatabaseHelper.setCollection(settingsModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTasks(Tasks tasks) async {
    try {
      final settingsModel = ToDoSettingsModel(
        id: tasks.id,
        description: tasks.description,
        archived: tasks.isArchived == true ? 1 : 0,
        completed: tasks.isCompleted == true ? 1 : 0,
        collectionId: tasks.collectionId,
      );

      await DatabaseHelper.updateTask(settingsModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    try {
      await DatabaseHelper.deleteTask(taskId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTaskFromCollection(int collectionId) async {
    try {
      await DatabaseHelper.deleteTaskFromCollection(collectionId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(int collectionId) async {
    try {
      await DatabaseHelper.deleteCollection(collectionId);
    } catch (e) {
      rethrow;
    }
  }
}
