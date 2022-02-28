import 'package:todo_win/domain/repositories/settings_repository.dart';

class DeleteTaskUseCase {
  final SettingsRepository settingsRepository;

  DeleteTaskUseCase({required this.settingsRepository});

  Future<void> call(int taskId) async {
    try {
      await settingsRepository.deleteTask(taskId);
    } catch (_) {
      rethrow;
    }
  }
}
