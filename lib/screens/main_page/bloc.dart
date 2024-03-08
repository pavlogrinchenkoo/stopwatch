import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/routers/routes.dart';
import 'package:quad_timer/utils/bloc_base.dart';


class MainBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  MainBloc() {
    setState(ScreenState());
  }

  void init(BuildContext context) async {
  }

  void goToAnalytics(BuildContext context) {
    context.router.push(const AnalyticsRoute());
  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
