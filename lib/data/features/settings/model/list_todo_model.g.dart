// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListToDoModel _$ListToDoModelFromJson(Map<String, dynamic> json) {
  return ListToDoModel(
    listTodo: (json['listTodo'] as List<dynamic>?)
        ?.map((e) => ToDoSettingsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ListToDoModelToJson(ListToDoModel instance) =>
    <String, dynamic>{
      'listTodo': instance.listTodo,
    };
