import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/screens/analytics_page/page.dart';
import 'package:quad_timer/screens/main_page/pages/page.dart';
import 'package:quad_timer/screens/main_page/widgets/custom_timer.dart';
import 'package:quad_timer/screens/splash_page/page.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(path: '/main', page: MainRoute.page, children: [
      AutoRoute(path: 'timer', page: CustomTimerIphoneRoute.page),
      // AutoRoute(path: 'analytics', page: AnalyticsRoute.page),
    ]),

    AutoRoute(path: '/analytics', page: AnalyticsRoute.page),
  ];
}

// dart run build_runner watch
// dart run build_runner build
