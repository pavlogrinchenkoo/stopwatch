import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/generated/assets.gen.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_functions.dart';
import 'package:quad_timer/utils/custom_stream_builder.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';

import 'bloc_timer.dart';

class CustomTimer extends StatefulWidget {
  final String name;
  final Widget icon;

  const CustomTimer({super.key, required this.name, required this.icon});

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  final TimerBloc bloc = TimerBloc();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return Container(
            color: state.isCueStartTimer
                ? state.isPauseTimer
                    ? BC.lightRed
                    : BC.lightOrange
                : state.isStartTimer
                    ? state.isPauseTimer
                        ? BC.lightRed
                        : BC.lightRed
                    : Colors.transparent,
            padding:
                 EdgeInsets.only(left: getAdaptivePadding(40), right: getAdaptivePadding(35), top: getAdaptivePadding(20), bottom: getAdaptivePadding(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    widget.icon,
                    Space.w24,
                    Text(widget.name, style: BS.reg48),
                  ],
                ),
                Space.h16,
                Text(state.time, style: BS.reg90),
                Space.h16,
                Row(
                  children: [
                    state.isStartTimer
                        ? state.isPauseTimer
                            ? CustomButton(
                                text: 'Resume',
                                onTap: () => bloc.resumeTimer(),
                                color: BC.red,
                              )
                            : CustomButton(
                                text: 'Pause',
                                onTap: () => bloc.pauseTimer(),
                                color: BC.gray,
                              )
                        : CustomButton(
                            text: 'Hold',
                            onTap: () => bloc.startTimer(),
                            color: BC.red,
                          ),
                    Space.w24,
                    state.isCueStartTimer
                        ? CustomButtonCue(
                            text: state.cueTime,
                            onTap: () => bloc.cueStartTimer(
                                '${widget.name.toLowerCase()}_cue'),
                            color: BC.orange,
                          )
                        : CustomButton(
                            text: 'Cue',
                            onTap: () => bloc.cueStartTimer(
                                '${widget.name.toLowerCase()}_cue'),
                            color: BC.blue,
                          ),
                    Space.w24,
                    CustomButton(
                      text: 'Clear',
                      onTap: () =>
                          bloc.clearTimer('${widget.name.toLowerCase()}_clear'),
                      color: BC.green,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

@RoutePage()
class CustomTimerIphonePage extends StatefulWidget {
  final String name;
  final Widget icon;

  const CustomTimerIphonePage(
      {super.key, required this.name, required this.icon});

  @override
  State<CustomTimerIphonePage> createState() => _CustomTimerIphonePageState();
}

class _CustomTimerIphonePageState extends State<CustomTimerIphonePage> {
  final TimerBloc bloc = TimerBloc();

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return Container(
            color: state.isCueStartTimer
                ? state.isPauseTimer
                    ? BC.lightRed
                    : BC.lightOrange
                : state.isStartTimer
                    ? state.isPauseTimer
                        ? BC.lightRed
                        : BC.lightRed
                    : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon,
                    Space.w24,
                    Text(widget.name, style: BS.reg48),
                  ],
                ),
                Space.h16,
                Text(state.time, style: BS.reg80),
                Space.h32,
                Space.h32,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state.isStartTimer
                        ? state.isPauseTimer
                            ? CustomButton(
                                text: 'Resume',
                                onTap: () => bloc.resumeTimer(),
                                color: BC.red,
                              )
                            : CustomButton(
                                text: 'Pause',
                                onTap: () => bloc.pauseTimer(),
                                color: BC.gray,
                              )
                        : CustomButton(
                            text: 'Hold',
                            onTap: () => bloc.startTimer(),
                            color: BC.red,
                          ),
                    Space.h24,
                    state.isCueStartTimer
                        ? CustomButtonCue(
                            text: state.cueTime,
                            onTap: () => bloc.cueStartTimer(
                                '${widget.name.toLowerCase()}_cue'),
                            color: BC.orange,
                          )
                        : CustomButton(
                            text: 'Cue',
                            onTap: () => bloc.cueStartTimer(
                                '${widget.name.toLowerCase()}_cue'),
                            color: BC.blue,
                          ),
                    Space.h24,
                    CustomButton(
                      text: 'Clear',
                      onTap: () =>
                          bloc.clearTimer('${widget.name.toLowerCase()}_clear'),
                      color: BC.green,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
