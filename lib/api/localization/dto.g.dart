// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationModel _$LocalizationModelFromJson(Map<String, dynamic> json) =>
    LocalizationModel(
      locale: json['locale'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      artisticInterpretation: json['artisticInterpretation'] as String?,
      artisticInterpretationPrompt:
          json['artisticInterpretationPrompt'] as String?,
      painting: json['painting'] as String?,
      menu: (json['menu'] as List<dynamic>?)?.map((e) => e as String).toList(),
      termsOfUse: json['termsOfUse'] as String?,
      termsOfUseText: json['termsOfUseText'] as String?,
      privacyPolicy: json['privacyPolicy'] as String?,
      privacyPolicyText: json['privacyPolicyText'] as String?,
      licenses: json['licenses'] as String?,
      licensesText: json['licensesText'] as String?,
    );

Map<String, dynamic> _$LocalizationModelToJson(LocalizationModel instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'artists': instance.artists,
      'artisticInterpretation': instance.artisticInterpretation,
      'artisticInterpretationPrompt': instance.artisticInterpretationPrompt,
      'painting': instance.painting,
      'menu': instance.menu,
      'termsOfUse': instance.termsOfUse,
      'termsOfUseText': instance.termsOfUseText,
      'privacyPolicy': instance.privacyPolicy,
      'privacyPolicyText': instance.privacyPolicyText,
      'licenses': instance.licenses,
      'licensesText': instance.licensesText,
    };

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      name: json['name'] as String?,
      styles:
          (json['styles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'styles': instance.styles,
    };
