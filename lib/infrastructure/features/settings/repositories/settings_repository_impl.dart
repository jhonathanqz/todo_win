import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/contracts/settings_provider.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsProvider settingsProvider;

  SettingsRepositoryImpl({required this.settingsProvider});

  @override
  Future<Tasks> getTasks() async {
    try {
      return await settingsProvider.getTasks();
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
}
