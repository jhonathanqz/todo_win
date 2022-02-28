import 'package:get_it/get_it.dart';
import 'package:todo_win/data/features/settings/provider/settings_provider_impl.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';
import 'package:todo_win/domain/use_cases/get_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/set_tasks_use_case.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/contracts/settings_provider.dart';
import 'package:todo_win/infrastructure/features/settings/repositories/settings_repository_impl.dart';
import 'package:todo_win/presentation/features/settings/mobx/settings.store.dart';
import 'package:todo_win/presentation/features/splash/mobx/splash.store.dart';

final sl = GetIt.I;
//final sl sl = sl.instance;

void setupDependencies() {
  setupProvider();
  setupRepository();
  setupUseCase();
  setupMobx();
}

void setupProvider() {
  sl.registerLazySingleton<SettingsProvider>(
    () => SettingsProviderImpl(),
  );
}

void setupRepository() {
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      settingsProvider: sl<SettingsProvider>(),
    ),
  );
}

void setupUseCase() {
  sl.registerLazySingleton<GetTasksUseCase>(
    () => GetTasksUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<SetTasksUseCase>(
    () => SetTasksUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );
}

setupMobx() {
  sl.registerLazySingleton<SplashStore>(() => SplashStore());

  sl.registerLazySingleton<SettingsStore>(
    () => SettingsStore(
      getTasksUseCase: sl<GetTasksUseCase>(),
      setTasksUseCase: sl<SetTasksUseCase>(),
    ),
  );
}
