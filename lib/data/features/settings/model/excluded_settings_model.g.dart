// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excluded_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExcludedSettingsModel _$ExcludedSettingsModelFromJson(
    Map<String, dynamic> json) {
  return ExcludedSettingsModel(
    id: json['id'] as int?,
    description: json['description'] as String,
    archived: json['archived'] as int,
    completed: json['completed'] as int,
    collectionId: json['collectionId'] as int,
  );
}

Map<String, dynamic> _$ExcludedSettingsModelToJson(
        ExcludedSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'archived': instance.archived,
      'completed': instance.completed,
      'collectionId': instance.collectionId,
    };
