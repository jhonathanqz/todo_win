// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsBase, Store {
  final _$isLoadingAtom = Atom(name: 'SettingsBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$tasksAtom = Atom(name: 'SettingsBase.tasks');

  @override
  Tasks get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(Tasks value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$errorAtom = Atom(name: 'SettingsBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$isLoggedAutoAtom = Atom(name: 'SettingsBase.isLoggedAuto');

  @override
  bool get isLoggedAuto {
    _$isLoggedAutoAtom.reportRead();
    return super.isLoggedAuto;
  }

  @override
  set isLoggedAuto(bool value) {
    _$isLoggedAutoAtom.reportWrite(value, super.isLoggedAuto, () {
      super.isLoggedAuto = value;
    });
  }

  final _$getTasksAsyncAction = AsyncAction('SettingsBase.getTasks');

  @override
  Future<Tasks> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  final _$setTasksAsyncAction = AsyncAction('SettingsBase.setTasks');

  @override
  Future<void> setTasks(
      {required BuildContext context,
      required dynamic Function() callbackSucess}) {
    return _$setTasksAsyncAction.run(
        () => super.setTasks(context: context, callbackSucess: callbackSucess));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
tasks: ${tasks},
error: ${error},
isLoggedAuto: ${isLoggedAuto}
    ''';
  }
}
