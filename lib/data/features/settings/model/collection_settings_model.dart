import 'package:json_annotation/json_annotation.dart';

part 'collection_settings_model.g.dart';

@JsonSerializable()
class CollectionSettingsModel {
  final int? id;
  final String collectionName;

  CollectionSettingsModel({
    this.id,
    required this.collectionName,
  });

  factory CollectionSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionSettingsModelToJson(this);
}
