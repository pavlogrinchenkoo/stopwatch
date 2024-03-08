import 'dart:convert';

import 'package:quad_timer/api/time/dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  Future<void> saveTimeCue(TimeModel timeModel, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final timeList = await getTimeCue(key);
    if (timeList == null) {
      final string = jsonEncode([timeModel]);
      await prefs.setString(key, string);
      return;
    }
    prefs.remove(key);
    timeList.add(timeModel);
    final string = jsonEncode(timeList);
    await prefs.setString(key, string);
  }

  Future<void> removeTimeCue() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('vault_cue');
    prefs.remove('bars_cue');
    prefs.remove('beam_cue');
    prefs.remove('floor_cue');
  }

  Future<List<TimeModel>?> getTimeCue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final string = prefs.getString(key);
    if (string == null) return null;

    final List<dynamic> jsonList = jsonDecode(string);
    final List<TimeModel> timeList =
        jsonList.map((e) => TimeModel.fromJson(e)).toList();
    return timeList;
  }

  Future<void> saveTimeClear(TimeModel timeModel, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final timeList = await getTimeCue(key);
    if (timeList == null) {
      final string = jsonEncode([timeModel]);
      await prefs.setString(key, string);
      return;
    }
    prefs.remove(key);
    timeList.add(timeModel);
    final string = jsonEncode(timeList);
    await prefs.setString(key, string);
  }

  Future<void> removeTimeClear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('vault_clear');
    prefs.remove('bars_clear');
    prefs.remove('beam_clear');
    prefs.remove('floor_clear');
  }

  Future<List<TimeModel>?> getTimeClear(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final string = prefs.getString(key);
    if (string == null) return null;

    final List<dynamic> jsonList = jsonDecode(string);
    final List<TimeModel> timeList =
        jsonList.map((e) => TimeModel.fromJson(e)).toList();
    return timeList;
  }
}
