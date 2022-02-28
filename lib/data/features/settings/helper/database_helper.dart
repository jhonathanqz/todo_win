import 'dart:convert';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_win/data/features/settings/model/collection_settings_model.dart';
import 'package:todo_win/data/features/settings/model/todo_settings_model.dart';
import 'package:todo_win/domain/exceptions/settings_exceptions.dart';
import 'package:todo_win/utils/strings.dart';

class DatabaseStrings {
  static const name = 'todowin.db';

  static const collectionTable = 'Collection';
  static const todoTable = 'ToDo';
  static const excludedTable = 'Excluded';

  static const collectionTableScript =
      'CREATE TABLE $collectionTable (id INTEGER PRIMARY KEY AUTOINCREMENT, collectionName TEXT)';
  static const todoTableScript =
      'CREATE TABLE $todoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, archived INTEGER, completed INTEGER, collectionId INTEGER)';
  static const excludedTableScript =
      'CREATE TABLE $excludedTable (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, archived INTEGER, completed INTEGER, collectionId INTEGER)';
}

class DatabaseHelper {
  static Database? _database;

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(DatabaseStrings.collectionTableScript);
    await db.execute(DatabaseStrings.todoTableScript);
    await db.execute(DatabaseStrings.excludedTableScript);
  }

  static Future<Database> get database async {
    final path = join(
      await getDatabasesPath(),
      DatabaseStrings.name,
    );

    _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    return _database!;
  }

  static Future<List<ToDoSettingsModel>> getTasks(int collectionId) async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(
        DatabaseStrings.todoTable,
        where: "collectionId = ?",
        whereArgs: [collectionId],
      );

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      final encode = jsonEncode(result);
      final converToJson = json.decode(encode);

      final model = (converToJson as List<dynamic>)
          .map((e) => ToDoSettingsModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return model;
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> setTasks(ToDoSettingsModel toDoSettingsModel) async {
    try {
      final tmpDb = await database;

      //await tmpDb.delete(DatabaseStrings.todoTable);
      await tmpDb.insert(
        DatabaseStrings.todoTable,
        toDoSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }

  static Future<List<CollectionSettingsModel>> getCollections() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.collectionTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      final encode = jsonEncode(result);
      final converToJson = json.decode(encode);

      final model = (converToJson as List<dynamic>)
          .map((e) =>
              CollectionSettingsModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return model;
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> setCollection(
      CollectionSettingsModel collectionSettingsModel) async {
    try {
      final tmpDb = await database;

      //await tmpDb.delete(DatabaseStrings.todoTable);
      await tmpDb.insert(
        DatabaseStrings.collectionTable,
        collectionSettingsModel.toJson(),
      );
    } catch (_) {
      throw UnableToSetSettings(Strings.unableToSetSettings);
    }
  }

  static Future<void> updateTask(ToDoSettingsModel toDoSettingsModel) async {
    try {
      final tmpDb = await database;

      await tmpDb.update(DatabaseStrings.todoTable, toDoSettingsModel.toJson(),
          where: "id = ?", whereArgs: [toDoSettingsModel.id]);
    } catch (_) {
      throw UpdateErrorSettings(Strings.updateErrorSettings);
    }
  }

  static Future<void> deleteTask(int taskId) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(
        DatabaseStrings.todoTable,
        where: "id = ?",
        whereArgs: [taskId],
      );
    } catch (_) {
      throw DeleteErrorSettings(Strings.deleteErrorSettings);
    }
  }

  static Future<void> deleteTaskFromCollection(int collectionId) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(
        DatabaseStrings.todoTable,
        where: "collectionId = ?",
        whereArgs: [collectionId],
      );
    } catch (_) {
      throw DeleteErrorSettings(Strings.deleteErrorSettings);
    }
  }

  static Future<void> deleteCollection(int collectionId) async {
    try {
      final tmpDb = await database;

      await tmpDb.delete(
        DatabaseStrings.collectionTable,
        where: "id = ?",
        whereArgs: [collectionId],
      );
    } catch (_) {
      throw DeleteErrorSettings(Strings.deleteErrorSettings);
    }
  }
}
