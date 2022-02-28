import 'package:json_annotation/json_annotation.dart';

part 'todo_settings_model.g.dart';

@JsonSerializable()
class ToDoSettingsModel {
  final int? id;
  final String description;
  final int archived;
  final int completed;
  final int collectionId;

  ToDoSettingsModel({
    this.id,
    required this.description,
    required this.archived,
    required this.completed,
    required this.collectionId,
  });

  factory ToDoSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoSettingsModelToJson(this);
}
