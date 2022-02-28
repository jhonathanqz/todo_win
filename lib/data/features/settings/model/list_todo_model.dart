import 'package:json_annotation/json_annotation.dart';
import 'package:todo_win/data/features/settings/model/todo_settings_model.dart';

part 'list_todo_model.g.dart';

@JsonSerializable()
class ListToDoModel {
  final List<ToDoSettingsModel>? listTodo;

  ListToDoModel({
    this.listTodo,
  });

  factory ListToDoModel.fromJson(Map<String, dynamic> json) =>
      _$ListToDoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListToDoModelToJson(this);
}
