import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/contracts/settings_provider.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsProvider settingsProvider;

  SettingsRepositoryImpl({required this.settingsProvider});

  @override
  Future<List<Tasks>> getTasks(int collectionId) async {
    try {
      return await settingsProvider.getTasks(collectionId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setTasks(Tasks tasks) async {
    try {
      await settingsProvider.setTasks(tasks);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Collection>> getCollections() async {
    try {
      return await settingsProvider.getCollections();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> setCollections(Collection collection) async {
    try {
      await settingsProvider.setCollections(collection);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateTasks(Tasks tasks) async {
    try {
      await settingsProvider.updateTasks(tasks);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    try {
      await settingsProvider.deleteTask(taskId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTaskFromCollection(int collectionId) async {
    try {
      await settingsProvider.deleteTaskFromCollection(collectionId);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteCollection(int collectionID) async {
    try {
      await settingsProvider.deleteCollection(collectionID);
    } catch (_) {
      rethrow;
    }
  }
}
