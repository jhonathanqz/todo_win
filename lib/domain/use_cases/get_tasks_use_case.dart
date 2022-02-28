import 'package:todo_win/domain/entities/tasks.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class GetTasksUseCase {
  final SettingsRepository settingsRepository;

  GetTasksUseCase({required this.settingsRepository});

  Future<List<Tasks>> call(int collectionId) async {
    try {
      return await settingsRepository.getTasks(collectionId);
    } catch (_) {
      rethrow;
    }
  }
}
