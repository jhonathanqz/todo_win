import 'package:todo_win/domain/entities/collection.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';

class GetCollectionsUseCase {
  final SettingsRepository settingsRepository;

  GetCollectionsUseCase({required this.settingsRepository});

  Future<List<Collection>> call() async {
    try {
      return await settingsRepository.getCollections();
    } catch (_) {
      rethrow;
    }
  }
}
