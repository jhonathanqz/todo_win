import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class SetTasksUseCase {
  final SettingsRepository settingsRepository;

  SetTasksUseCase({required this.settingsRepository});

  Future<void> call(Tasks tasks) async {
    try {
      await settingsRepository.setTasks(tasks);
    } catch (_) {
      rethrow;
    }
  }
}
