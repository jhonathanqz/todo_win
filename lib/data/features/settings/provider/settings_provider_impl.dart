//SitefSettings
import 'package:todo_win/data/features/settings/helper/database_helper.dart';
import 'package:todo_win/data/features/settings/model/todo_settings_model.dart';
import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/contracts/settings_provider.dart';

class SettingsProviderImpl implements SettingsProvider {
  @override
  Future<Tasks> getTasks() async {
    try {
      final settingsModel = await DatabaseHelper.getTasks();

      return Tasks(
        id: settingsModel.id!,
        description: settingsModel.description,
        isArchived: settingsModel.archived == 1 ? true : false,
        isCompleted: settingsModel.completed == 1 ? true : false,
        collectionName: settingsModel.collectionName,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setTasks(Tasks tasks) async {
    try {
      final settingsModel = ToDoSettingsModel(
        id: tasks.id,
        description: tasks.description,
        archived: tasks.isArchived == true ? 1 : 0,
        completed: tasks.isCompleted == true ? 1 : 0,
        collectionName: tasks.collectionName,
      );

      await DatabaseHelper.setTasks(settingsModel);
    } catch (e) {
      rethrow;
    }
  }
}
