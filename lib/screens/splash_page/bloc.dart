import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/routers/routes.dart';
import 'package:quad_timer/utils/bloc_base.dart';


class SplashBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  SplashBloc() {
    setState(ScreenState());
  }

  void init(BuildContext context) async {

    // await Future.delayed(const Duration(seconds: 2));
    context.router.replace(MainRoute());
  }
}

class ScreenState {
  final bool loading;

  ScreenState({this.loading = false});

  ScreenState copyWith({bool? loading}) {
    return ScreenState(loading: loading ?? this.loading);
  }
}
