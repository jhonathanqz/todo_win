// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionSettingsModel _$CollectionSettingsModelFromJson(
    Map<String, dynamic> json) {
  return CollectionSettingsModel(
    id: json['id'] as int?,
    collectionName: json['collectionName'] as String,
  );
}

Map<String, dynamic> _$CollectionSettingsModelToJson(
        CollectionSettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionName': instance.collectionName,
    };
