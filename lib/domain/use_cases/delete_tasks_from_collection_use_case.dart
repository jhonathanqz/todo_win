import 'package:todo_win/domain/repositories/settings_repository.dart';

class DeleteTasksFromCollectionUseCase {
  final SettingsRepository settingsRepository;

  DeleteTasksFromCollectionUseCase({required this.settingsRepository});

  Future<void> call(int collectionId) async {
    try {
      await settingsRepository.deleteTaskFromCollection(collectionId);
    } catch (_) {
      rethrow;
    }
  }
}
