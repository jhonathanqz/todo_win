import 'package:json_annotation/json_annotation.dart';

part 'excluded_settings_model.g.dart';

@JsonSerializable()
class ExcludedSettingsModel {
  final int? id;
  final String description;
  final int archived;
  final int completed;
  final int collectionId;

  ExcludedSettingsModel({
    this.id,
    required this.description,
    required this.archived,
    required this.completed,
    required this.collectionId,
  });

  factory ExcludedSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ExcludedSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExcludedSettingsModelToJson(this);
}
