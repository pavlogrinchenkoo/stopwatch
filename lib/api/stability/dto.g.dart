// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StabilityModel _$StabilityModelFromJson(Map<String, dynamic> json) =>
    StabilityModel(
      artifacts: (json['artifacts'] as List<dynamic>?)
          ?.map((e) => ArtifactsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StabilityModelToJson(StabilityModel instance) =>
    <String, dynamic>{
      'artifacts': instance.artifacts,
    };

ArtifactsModel _$ArtifactsModelFromJson(Map<String, dynamic> json) =>
    ArtifactsModel(
      base64: json['base64'] as String?,
    );

Map<String, dynamic> _$ArtifactsModelToJson(ArtifactsModel instance) =>
    <String, dynamic>{
      'base64': instance.base64,
    };
