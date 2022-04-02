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

  final _$selectedCollectionAtom =
      Atom(name: 'SettingsBase.selectedCollection');

  @override
  Collection? get selectedCollection {
    _$selectedCollectionAtom.reportRead();
    return super.selectedCollection;
  }

  @override
  set selectedCollection(Collection? value) {
    _$selectedCollectionAtom.reportWrite(value, super.selectedCollection, () {
      super.selectedCollection = value;
    });
  }

  final _$listCollectionAtom = Atom(name: 'SettingsBase.listCollection');

  @override
  List<Collection> get listCollection {
    _$listCollectionAtom.reportRead();
    return super.listCollection;
  }

  @override
  set listCollection(List<Collection> value) {
    _$listCollectionAtom.reportWrite(value, super.listCollection, () {
      super.listCollection = value;
    });
  }

  final _$createCollectionNameAtom =
      Atom(name: 'SettingsBase.createCollectionName');

  @override
  String get createCollectionName {
    _$createCollectionNameAtom.reportRead();
    return super.createCollectionName;
  }

  @override
  set createCollectionName(String value) {
    _$createCollectionNameAtom.reportWrite(value, super.createCollectionName,
        () {
      super.createCollectionName = value;
    });
  }

  final _$selectedTasksAtom = Atom(name: 'SettingsBase.selectedTasks');

  @override
  Tasks? get selectedTasks {
    _$selectedTasksAtom.reportRead();
    return super.selectedTasks;
  }

  @override
  set selectedTasks(Tasks? value) {
    _$selectedTasksAtom.reportWrite(value, super.selectedTasks, () {
      super.selectedTasks = value;
    });
  }

  final _$listTasksAtom = Atom(name: 'SettingsBase.listTasks');

  @override
  List<Tasks> get listTasks {
    _$listTasksAtom.reportRead();
    return super.listTasks;
  }

  @override
  set listTasks(List<Tasks> value) {
    _$listTasksAtom.reportWrite(value, super.listTasks, () {
      super.listTasks = value;
    });
  }

  final _$listTasksArchivedAtom = Atom(name: 'SettingsBase.listTasksArchived');

  @override
  List<Tasks> get listTasksArchived {
    _$listTasksArchivedAtom.reportRead();
    return super.listTasksArchived;
  }

  @override
  set listTasksArchived(List<Tasks> value) {
    _$listTasksArchivedAtom.reportWrite(value, super.listTasksArchived, () {
      super.listTasksArchived = value;
    });
  }

  final _$listTasksNotArchivedAtom =
      Atom(name: 'SettingsBase.listTasksNotArchived');

  @override
  List<Tasks> get listTasksNotArchived {
    _$listTasksNotArchivedAtom.reportRead();
    return super.listTasksNotArchived;
  }

  @override
  set listTasksNotArchived(List<Tasks> value) {
    _$listTasksNotArchivedAtom.reportWrite(value, super.listTasksNotArchived,
        () {
      super.listTasksNotArchived = value;
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

  final _$isArchiveListAtom = Atom(name: 'SettingsBase.isArchiveList');

  @override
  bool get isArchiveList {
    _$isArchiveListAtom.reportRead();
    return super.isArchiveList;
  }

  @override
  set isArchiveList(bool value) {
    _$isArchiveListAtom.reportWrite(value, super.isArchiveList, () {
      super.isArchiveList = value;
    });
  }

  final _$isDateRegisterAtom = Atom(name: 'SettingsBase.isDateRegister');

  @override
  bool get isDateRegister {
    _$isDateRegisterAtom.reportRead();
    return super.isDateRegister;
  }

  @override
  set isDateRegister(bool value) {
    _$isDateRegisterAtom.reportWrite(value, super.isDateRegister, () {
      super.isDateRegister = value;
    });
  }

  final _$getTasksAsyncAction = AsyncAction('SettingsBase.getTasks');

  @override
  Future<List<Tasks>> getTasks() {
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

  final _$updateTasksAsyncAction = AsyncAction('SettingsBase.updateTasks');

  @override
  Future<void> updateTasks(
      {required BuildContext context,
      required dynamic Function() callBackSucess}) {
    return _$updateTasksAsyncAction.run(() =>
        super.updateTasks(context: context, callBackSucess: callBackSucess));
  }

  final _$deleteTaskAsyncAction = AsyncAction('SettingsBase.deleteTask');

  @override
  Future<void> deleteTask(
      {required BuildContext context, required int taskId}) {
    return _$deleteTaskAsyncAction
        .run(() => super.deleteTask(context: context, taskId: taskId));
  }

  final _$deleteTaskFromCollectionAsyncAction =
      AsyncAction('SettingsBase.deleteTaskFromCollection');

  @override
  Future<void> deleteTaskFromCollection({required BuildContext context}) {
    return _$deleteTaskFromCollectionAsyncAction
        .run(() => super.deleteTaskFromCollection(context: context));
  }

  final _$deleteCollectionAsyncAction =
      AsyncAction('SettingsBase.deleteCollection');

  @override
  Future<void> deleteCollection(
      {required BuildContext context,
      required int collectionId,
      required dynamic Function() callBackSucess}) {
    return _$deleteCollectionAsyncAction.run(() => super.deleteCollection(
        context: context,
        collectionId: collectionId,
        callBackSucess: callBackSucess));
  }

  final _$archiveTasksAsyncAction = AsyncAction('SettingsBase.archiveTasks');

  @override
  Future<void> archiveTasks({required BuildContext context}) {
    return _$archiveTasksAsyncAction
        .run(() => super.archiveTasks(context: context));
  }

  final _$getCollectionsAsyncAction =
      AsyncAction('SettingsBase.getCollections');

  @override
  Future<List<Collection>> getCollections() {
    return _$getCollectionsAsyncAction.run(() => super.getCollections());
  }

  final _$setCollectionAsyncAction = AsyncAction('SettingsBase.setCollection');

  @override
  Future<void> setCollection(
      {required BuildContext context,
      required dynamic Function() callbackSucess}) {
    return _$setCollectionAsyncAction.run(() =>
        super.setCollection(context: context, callbackSucess: callbackSucess));
  }

  final _$SettingsBaseActionController = ActionController(name: 'SettingsBase');

  @override
  void setIsArchiveList(bool value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setIsArchiveList');
    try {
      return super.setIsArchiveList(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateRegister(bool value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setDateRegister');
    try {
      return super.setDateRegister(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isCompletedUpdate(bool value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.isCompletedUpdate');
    try {
      return super.isCompletedUpdate(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editDescriptionTask(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.editDescriptionTask');
    try {
      return super.editDescriptionTask(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescriptionTask(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setDescriptionTask');
    try {
      return super.setDescriptionTask(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCollectionName(String value) {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.setCollectionName');
    try {
      return super.setCollectionName(value);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeSelectedTask() {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.wipeSelectedTask');
    try {
      return super.wipeSelectedTask();
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wipeListTasks() {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase.wipeListTasks');
    try {
      return super.wipeListTasks();
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _wipeCollectionList() {
    final _$actionInfo = _$SettingsBaseActionController.startAction(
        name: 'SettingsBase._wipeCollectionList');
    try {
      return super._wipeCollectionList();
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
tasks: ${tasks},
selectedCollection: ${selectedCollection},
listCollection: ${listCollection},
createCollectionName: ${createCollectionName},
selectedTasks: ${selectedTasks},
listTasks: ${listTasks},
listTasksArchived: ${listTasksArchived},
listTasksNotArchived: ${listTasksNotArchived},
error: ${error},
isArchiveList: ${isArchiveList},
isDateRegister: ${isDateRegister}
    ''';
  }
}
