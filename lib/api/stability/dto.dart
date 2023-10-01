// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable()
class StabilityModel {
  List<ArtifactsModel>? artifacts;

  StabilityModel({
    this.artifacts,
  });

  factory StabilityModel.fromJson(Map<String, dynamic> json) =>
      _$StabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$StabilityModelToJson(this);
}

@JsonSerializable()
class ArtifactsModel {
  String? base64;

  ArtifactsModel({this.base64});

  factory ArtifactsModel.fromJson(Map<String, dynamic> json) =>
      _$ArtifactsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtifactsModelToJson(this);
}
