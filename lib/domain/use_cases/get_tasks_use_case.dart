import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class GetTasksUseCase {
  final SettingsRepository settingsRepository;

  GetTasksUseCase({required this.settingsRepository});

  Future<Tasks> call() async {
    try {
      return await settingsRepository.getTasks();
    } catch (_) {
      rethrow;
    }
  }
}
