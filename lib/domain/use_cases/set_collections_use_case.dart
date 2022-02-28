import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class SetCollectionsUseCase {
  final SettingsRepository settingsRepository;

  SetCollectionsUseCase({required this.settingsRepository});

  Future<void> call(Collection collection) async {
    try {
      await settingsRepository.setCollections(collection);
    } catch (_) {
      rethrow;
    }
  }
}
