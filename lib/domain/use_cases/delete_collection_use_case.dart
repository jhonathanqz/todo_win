import 'package:todo_win/domain/repositories/settings_repository.dart';

class DeleteCollectionUseCase {
  final SettingsRepository settingsRepository;

  DeleteCollectionUseCase({required this.settingsRepository});

  Future<void> call(int collectionID) async {
    try {
      await settingsRepository.deleteCollection(collectionID);
    } catch (_) {
      rethrow;
    }
  }
}
