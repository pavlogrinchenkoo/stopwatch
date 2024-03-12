// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) => TimeModel(
      seconds: json['seconds'] as int? ?? 00,
      minutes: json['minutes'] as int? ?? 00,
      milliseconds: json['milliseconds'] as int? ?? 00,
    );

Map<String, dynamic> _$TimeModelToJson(TimeModel instance) => <String, dynamic>{
      'seconds': instance.seconds,
      'minutes': instance.minutes,
      'milliseconds': instance.milliseconds,
    };
