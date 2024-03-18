// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnalyticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnalyticsPage(),
      );
    },
    CustomTimerIphoneRoute.name: (routeData) {
      final args = routeData.argsAs<CustomTimerIphoneRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomTimerIphonePage(
          key: args.key,
          name: args.name,
          icon: args.icon,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AnalyticsPage]
class AnalyticsRoute extends PageRouteInfo<void> {
  const AnalyticsRoute({List<PageRouteInfo>? children})
      : super(
          AnalyticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomTimerIphonePage]
class CustomTimerIphoneRoute extends PageRouteInfo<CustomTimerIphoneRouteArgs> {
  CustomTimerIphoneRoute({
    Key? key,
    required String name,
    required Widget icon,
    List<PageRouteInfo>? children,
  }) : super(
          CustomTimerIphoneRoute.name,
          args: CustomTimerIphoneRouteArgs(
            key: key,
            name: name,
            icon: icon,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomTimerIphoneRoute';

  static const PageInfo<CustomTimerIphoneRouteArgs> page =
      PageInfo<CustomTimerIphoneRouteArgs>(name);
}

class CustomTimerIphoneRouteArgs {
  const CustomTimerIphoneRouteArgs({
    this.key,
    required this.name,
    required this.icon,
  });

  final Key? key;

  final String name;

  final Widget icon;

  @override
  String toString() {
    return 'CustomTimerIphoneRouteArgs{key: $key, name: $name, icon: $icon}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
