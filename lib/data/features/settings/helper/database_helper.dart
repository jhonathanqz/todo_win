import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
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
      'CREATE TABLE $todoTable (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, archived INTEGER, completed INTEGER, collectionName TEXT)';
  static const excludedTableScript =
      'CREATE TABLE $excludedTable (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, archived INTEGER, completed INTEGER, collectionName TEXT)';
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

  static Future<ToDoSettingsModel> getTasks() async {
    try {
      final tmpDb = await database;

      final result = await tmpDb.query(DatabaseStrings.todoTable);

      if (result.isEmpty) {
        throw SettingsNotFound(Strings.settingsNotFound);
      }

      return ToDoSettingsModel.fromJson(result.first);
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
}
