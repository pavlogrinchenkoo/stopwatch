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
    int hours = 0;
    int secondsCue = 0;
    int minutesCue = 0;
    int hoursCue = 0;
    int secondsAll = 0;
    int minutesAll = 0;
    int hoursAll = 0;
    // final seconds = (milliseconds / 1000).truncate();
    // final minutes = (seconds / 60).truncate();
    // hours = (minutes / 60).truncate();
    // secondsRemainder = seconds % 60;
    // minutesRemainder = minutes % 60;
    setState(currentState.copyWith(isStartTimer: true, isPauseTimer: false));
    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (!currentState.isPauseTimer) {
        milliseconds = milliseconds + 1;
        if (milliseconds >= 1000) {
          milliseconds = 0;
          seconds = seconds + 1;
          secondsAll = secondsAll + 1;
          if (seconds == 60) {
            seconds = 0;
            minutes = minutes + 1;
            minutesAll = minutesAll + 1;
            if (minutes == 60) {
              minutes = 0;
              hours = hours + 1;
              hoursAll = hoursAll + 1;
            }
          }
          if (currentState.isCueStartTimer) {
            secondsCue = secondsCue + 1;
            if (secondsCue == 60) {
              secondsCue = 0;
              minutesCue = minutesCue + 1;
              if (minutesCue == 60) {
                minutesCue = 0;
                hoursCue = hoursCue + 1;
              }
            }
          }
        }
        if (currentState.isCueTap) {
          secondsCue = seconds;
          minutesCue = minutes;
          hoursCue = hours;
          seconds = 0;
          minutes = 0;
          hours = 0;
          setState(currentState.copyWith(isCueTap: false));
        }
        setState(currentState.copyWith(
          seconds: seconds,
          minutes: minutes,
          hours: hours,
          time:
              '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
          secondsCue: secondsCue,
          minutesCue: minutesCue,
          hoursCue: hoursCue,
          cueTime:
              '${hoursCue.toString().padLeft(2, '0')}:${minutesCue.toString().padLeft(2, '0')}:${secondsCue.toString().padLeft(2, '0')}',
          secondsAll: secondsAll,
          minutesAll: minutesAll,
          hoursAll: hoursAll,
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
          hours: currentState.hours);
      cache.saveTimeCue(timeModel, key);
      setState(currentState.copyWith(isCueStartTimer: true, isCueTap: true));
    }
  }

  void clearTimer(String key) {
    timer?.cancel();
    final timeModel = TimeModel(
      seconds: currentState.secondsAll,
      minutes: currentState.minutesAll,
      hours: currentState.hoursAll,
    );
    cache.saveTimeClear(timeModel, key);
    setState(currentState.copyWith(
      seconds: 0,
      minutes: 0,
      hours: 0,
      secondsCue: 0,
      minutesCue: 0,
      hoursCue: 0,
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
  final int seconds;
  final int minutes;
  final int hours;
  final int secondsCue;
  final int minutesCue;
  final int hoursCue;
  final int secondsAll;
  final int minutesAll;
  final int hoursAll;
  final String time;
  final String cueTime;

  ScreenState({
    this.isStartTimer = false,
    this.isPauseTimer = false,
    this.isCueStartTimer = false,
    this.isCueTap = false,
    this.seconds = 0,
    this.minutes = 0,
    this.hours = 0,
    this.secondsCue = 0,
    this.minutesCue = 0,
    this.hoursCue = 0,
    this.secondsAll = 0,
    this.minutesAll = 0,
    this.hoursAll = 0,
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
      int? hours,
      int? secondsCue,
      int? minutesCue,
      int? hoursCue,
      int? secondsAll,
      int? minutesAll,
      int? hoursAll,
      String? time,
      String? cueTime}) {
    return ScreenState(
      isStartTimer: isStartTimer ?? this.isStartTimer,
      isPauseTimer: isPauseTimer ?? this.isPauseTimer,
      isCueStartTimer: isCueStartTimer ?? this.isCueStartTimer,
      isCueTap: isCueTap ?? this.isCueTap,
      seconds: seconds ?? this.seconds,
      minutes: minutes ?? this.minutes,
      hours: hours ?? this.hours,
      secondsCue: secondsCue ?? this.secondsCue,
      minutesCue: minutesCue ?? this.minutesCue,
      hoursCue: hoursCue ?? this.hoursCue,
      secondsAll: secondsAll ?? this.secondsAll,
      minutesAll: minutesAll ?? this.minutesAll,
      hoursAll: hoursAll ?? this.hoursAll,
      time: time ?? this.time,
      cueTime: cueTime ?? this.cueTime,
    );
  }
}
