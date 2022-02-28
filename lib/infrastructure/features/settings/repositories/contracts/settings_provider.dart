import 'package:todo_win/domain/entities/tasks.dart';

abstract class SettingsProvider {
  Future<void> setTasks(Tasks tasks);
  Future<Tasks> getTasks();
}
