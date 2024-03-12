import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/api/cashe.dart';
import 'package:quad_timer/api/time/dto.dart';
import 'package:quad_timer/routers/routes.dart';
import 'package:quad_timer/utils/bloc_base.dart';

class TimerBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  Cache cache = Cache();

  TimerBloc() {
    setState(ScreenState());
  }

  Timer? timer;

  void init(BuildContext context) async {}

  void startTimer() {
    int milliseconds = 0;
    int seconds = 0;
    int minutes = 0;
    int secondsCue = 0;
    int minutesCue = 0;
    int secondsAll = 0;
    int minutesAll = 0;
    setState(currentState.copyWith(isStartTimer: true, isPauseTimer: false));
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (!currentState.isPauseTimer) {
        milliseconds += 10;
        if (milliseconds >= 1000) {
          milliseconds -= 1000;
          seconds++;
          secondsAll++;
          if (seconds == 60) {
            seconds = 0;
            minutes++;
            minutesAll++;
          }
          if (currentState.isCueStartTimer) {
            secondsCue++;
            if (secondsCue == 60) {
              secondsCue = 0;
              minutesCue++;
            }
          }
        }
        if (currentState.isCueTap) {
          secondsCue = seconds;
          minutesCue = minutes;
          seconds = 0;
          minutes = 0;
          milliseconds = 0;
          setState(currentState.copyWith(isCueTap: false));
        }
        setState(currentState.copyWith(
          seconds: seconds,
          minutes: minutes,
          milliseconds: milliseconds ~/ 10,
          // Display milliseconds correctly
          time:
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${(milliseconds ~/ 10).toString().padLeft(2, '0')}',
          secondsCue: secondsCue,
          minutesCue: minutesCue,
          millisecondsCue: milliseconds ~/ 10,
          // Display milliseconds correctly
          cueTime:
              '${minutesCue.toString().padLeft(2, '0')}:${secondsCue.toString().padLeft(2, '0')}:${(milliseconds ~/ 10).toString().padLeft(2, '0')}',
          secondsAll: secondsAll,
          minutesAll: minutesAll,
          millisecondsAll: milliseconds ~/ 10, // Display milliseconds correctly
        ));
      }
    });
  }

  void pauseTimer() {
    setState(currentState.copyWith(isPauseTimer: true));
  }

  void resumeTimer() {
    setState(currentState.copyWith(isPauseTimer: false));
  }

  void cueStartTimer(String key) {
    if (currentState.isStartTimer) {
      final timeModel = TimeModel(
          seconds: currentState.seconds,
          minutes: currentState.minutes,
          milliseconds: currentState.milliseconds);
      cache.saveTimeCue(timeModel, key);
      setState(currentState.copyWith(isCueStartTimer: true, isCueTap: true));
    }
  }

  void clearTimer(String key) {
    timer?.cancel();
    final timeModel = TimeModel(
      seconds: currentState.secondsAll,
      minutes: currentState.minutesAll,
      milliseconds: currentState.milliseconds,
    );
    cache.saveTimeClear(timeModel, key);
    setState(currentState.copyWith(
      seconds: 0,
      minutes: 0,
      milliseconds: 0,
      secondsCue: 0,
      minutesCue: 0,
      millisecondsCue: 0,
      secondsAll: 0,
      minutesAll: 0,
      millisecondsAll: 0,
      isStartTimer: false,
      isPauseTimer: false,
      isCueStartTimer: false,
      isCueTap: false,
      time: '00:00:00',
      cueTime: '00:00:00',
    ));
  }
}

class ScreenState {
  final bool isStartTimer;
  final bool isPauseTimer;
  final bool isCueStartTimer;
  final bool isCueTap;
  final int milliseconds;
  final int seconds;
  final int minutes;
  final int secondsCue;
  final int minutesCue;
  final int millisecondsCue;
  final int secondsAll;
  final int minutesAll;
  final int millisecondsAll;
  final String time;
  final String cueTime;

  ScreenState({
    this.isStartTimer = false,
    this.isPauseTimer = false,
    this.isCueStartTimer = false,
    this.isCueTap = false,
    this.milliseconds = 0,
    this.seconds = 0,
    this.minutes = 0,
    this.secondsCue = 0,
    this.minutesCue = 0,
    this.millisecondsCue = 0,
    this.secondsAll = 0,
    this.minutesAll = 0,
    this.millisecondsAll = 0,
    this.time = '00:00:00',
    this.cueTime = '00:00:00',
  });

  ScreenState copyWith(
      {bool? isStartTimer,
      bool? isPauseTimer,
      bool? isCueStartTimer,
      bool? isCueTap,
      int? seconds,
      int? minutes,
      int? milliseconds,
      int? secondsCue,
      int? minutesCue,
      int? millisecondsCue,
      int? secondsAll,
      int? minutesAll,
      int? millisecondsAll,
      String? time,
      String? cueTime}) {
    return ScreenState(
      isStartTimer: isStartTimer ?? this.isStartTimer,
      isPauseTimer: isPauseTimer ?? this.isPauseTimer,
      isCueStartTimer: isCueStartTimer ?? this.isCueStartTimer,
      isCueTap: isCueTap ?? this.isCueTap,
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      milliseconds: milliseconds ?? this.milliseconds,
      secondsCue: secondsCue ?? this.secondsCue,
      minutesCue: minutesCue ?? this.minutesCue,
      millisecondsCue: millisecondsCue ?? this.millisecondsCue,
      secondsAll: secondsAll ?? this.secondsAll,
      minutesAll: minutesAll ?? this.minutesAll,
      millisecondsAll: millisecondsAll ?? this.millisecondsAll,
      time: time ?? this.time,
      cueTime: cueTime ?? this.cueTime,
    );
  }
}
