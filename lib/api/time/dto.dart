
import 'package:json_annotation/json_annotation.dart';
part 'dto.g.dart';
@JsonSerializable()
class TimeModel{
  int seconds;
  int minutes;
  int hours;
  TimeModel({
     this.seconds = 00,
     this.minutes = 00,
     this.hours = 00,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) => _$TimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TimeModelToJson(this);


}