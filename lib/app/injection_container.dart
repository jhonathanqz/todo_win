import 'package:get_it/get_it.dart';
import 'package:todo_win/data/features/settings/provider/settings_provider_impl.dart';
import 'package:todo_win/domain/repositories/settings_repository.dart';
import 'package:todo_win/domain/use_cases/delete_collection_use_case.dart';
import 'package:todo_win/domain/use_cases/delete_task_use_case.dart';
import 'package:todo_win/domain/use_cases/delete_tasks_from_collection_use_case.dart';
import 'package:todo_win/domain/use_cases/get_collections_use_case.dart';
import 'package:todo_win/domain/use_cases/get_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/set_collections_use_case.dart';
import 'package:todo_win/domain/use_cases/set_tasks_use_case.dart';
import 'package:todo_win/domain/use_cases/update_tasks_use_case.dart';
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
  sl.registerFactory<SettingsProvider>(
    () => SettingsProviderImpl(),
  );
}

void setupRepository() {
  sl.registerFactory<SettingsRepository>(
    () => SettingsRepositoryImpl(
      settingsProvider: sl<SettingsProvider>(),
    ),
  );
}

void setupUseCase() {
  sl.registerFactory<GetTasksUseCase>(
    () => GetTasksUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerFactory<SetTasksUseCase>(
    () => SetTasksUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<UpdateTasksUseCase>(
    () => UpdateTasksUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<DeleteTaskUseCase>(
    () => DeleteTaskUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<DeleteTasksFromCollectionUseCase>(
    () => DeleteTasksFromCollectionUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<DeleteCollectionUseCase>(
    () => DeleteCollectionUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<GetCollectionsUseCase>(
    () => GetCollectionsUseCase(
      settingsRepository: sl<SettingsRepository>(),
    ),
  );

  sl.registerLazySingleton<SetCollectionsUseCase>(
    () => SetCollectionsUseCase(
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
      updateTasksUseCase: sl<UpdateTasksUseCase>(),
      deleteTaskUseCase: sl<DeleteTaskUseCase>(),
      deleteTasksFromCollectionUseCase: sl<DeleteTasksFromCollectionUseCase>(),
      deleteCollectionUseCase: sl<DeleteCollectionUseCase>(),
      getCollectionsUseCase: sl<GetCollectionsUseCase>(),
      setCollectionsUseCase: sl<SetCollectionsUseCase>(),
    ),
  );
}
