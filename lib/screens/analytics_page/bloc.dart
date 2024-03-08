import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/api/cashe.dart';
import 'package:quad_timer/api/time/dto.dart';
import 'package:quad_timer/utils/bloc_base.dart';

class AnalyticsBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  Cache cache = Cache();

  AnalyticsBloc() {
    setState(ScreenState());
  }

  void init() async {
    final listVaultCue = await cache.getTimeCue('vault_cue');
    final listBeamCue = await cache.getTimeCue('beam_cue');
    final listBarsCue = await cache.getTimeCue('bars_cue');
    final listFloorCue = await cache.getTimeCue('floor_cue');
    final listVaultClear = await cache.getTimeCue('vault_clear');
    final listBeamClear = await cache.getTimeCue('beam_clear');
    final listBarsClear = await cache.getTimeCue('bars_clear');
    final listFloorClear = await cache.getTimeCue('floor_clear');
    setState(currentState.copyWith(
      vaultCue: calculateAverageTime(listVaultCue ?? []),
      barsCue: calculateAverageTime(listBarsCue ?? []),
      beamCue: calculateAverageTime(listBeamCue ?? []),
      floorCue: calculateAverageTime(listFloorCue ?? []),
      vaultClear: calculateAverageTime(listVaultClear ?? []),
      barsClear: calculateAverageTime(listBarsClear ?? []),
      beamClear: calculateAverageTime(listBeamClear ?? []),
      floorClear: calculateAverageTime(listFloorClear ?? []),
      loading: false
    ));
  }

  String calculateAverageTime(List<TimeModel> timeList) {
    if (timeList.isEmpty) {
      return '00:00:00';
    }

    int totalSeconds = 00;
    int totalMinutes = 00;
    int totalHours = 00;
    for (final time in timeList) {
      totalSeconds += time.seconds;
      totalMinutes += time.minutes;
      totalHours += time.hours;
    }

    int averageSeconds = totalSeconds ~/ timeList.length;
    int averageMinutes = totalMinutes ~/ timeList.length;
    int averageHours = totalHours ~/ timeList.length;

    averageMinutes += averageSeconds ~/ 60;
    averageSeconds %= 60;
    averageHours += averageMinutes ~/ 60;
    averageMinutes %= 60;

    return '${formatNumber(averageHours)}:${formatNumber(averageMinutes)}:${formatNumber(averageSeconds)}';
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }


  void removeTime() {
    cache.removeTimeClear();
    cache.removeTimeCue();
   init();
  }
}

class ScreenState {
  final bool loading;
  final String vaultCue;
  final String beamCue;
  final String barsCue;
  final String floorCue;
  final String vaultClear;
  final String beamClear;
  final String barsClear;
  final String floorClear;

  ScreenState({
    this.loading = true,
    this.vaultCue = '00:00:00',
    this.beamCue = '00:00:00',
    this.barsCue = '00:00:00',
    this.floorCue = '00:00:00',
    this.vaultClear = '00:00:00',
    this.beamClear = '00:00:00',
    this.barsClear = '00:00:00',
    this.floorClear = '00:00:00',
  });

  ScreenState copyWith(
      {bool? loading,
      String? vaultCue,
      String? beamCue,
      String? barsCue,
      String? floorCue,
      String? vaultClear,
      String? beamClear,
      String? barsClear,
      String? floorClear}) {
    return ScreenState(
      loading: loading ?? this.loading,
      vaultCue: vaultCue ?? this.vaultCue,
      beamCue: beamCue ?? this.beamCue,
      barsCue: barsCue ?? this.barsCue,
      floorCue: floorCue ?? this.floorCue,
      vaultClear: vaultClear ?? this.vaultClear,
      beamClear: beamClear ?? this.beamClear,
      barsClear: barsClear ?? this.barsClear,
      floorClear: floorClear ?? this.floorClear,
    );
  }
}
