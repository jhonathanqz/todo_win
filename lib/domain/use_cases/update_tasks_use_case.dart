import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class UpdateTasksUseCase {
  final SettingsRepository settingsRepository;

  UpdateTasksUseCase({required this.settingsRepository});

  Future<void> call(Tasks tasks) async {
    try {
      await settingsRepository.updateTasks(tasks);
    } catch (_) {
      rethrow;
    }
  }
}
