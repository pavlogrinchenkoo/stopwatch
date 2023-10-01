// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable()
class LocalizationModel {
  String? locale;
  List<ArtistModel>? artists;
  String? artisticInterpretation;
  String? artisticInterpretationPrompt;
  String? painting;
  List<String>? menu;
  String? termsOfUse;
  String? termsOfUseText;
  String? privacyPolicy;
  String? privacyPolicyText;
  String? licenses;
  String? licensesText;

  LocalizationModel({
    this.locale,
    this.artists,
    this.artisticInterpretation,
    this.artisticInterpretationPrompt,
    this.painting,
    this.menu,
    this.termsOfUse,
    this.termsOfUseText,
    this.privacyPolicy,
    this.privacyPolicyText,
    this.licenses,
    this.licensesText,
  });

  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizationModelToJson(this);
}

@JsonSerializable()
class ArtistModel {
  String? name;
  List<String>? styles;

  ArtistModel({this.name, this.styles});

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
