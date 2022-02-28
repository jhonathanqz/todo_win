import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/entities/tasks.dart';

abstract class SettingsRepository {
  Future<void> setTasks(Tasks tasks);
  Future<List<Tasks>> getTasks(int collectionId);
  Future<void> setCollections(Collection collection);
  Future<List<Collection>> getCollections();
  Future<void> updateTasks(Tasks tasks);
  Future<void> deleteTask(int taskId);
  Future<void> deleteTaskFromCollection(int collectionId);
  Future<void> deleteCollection(int collectionID);
}
