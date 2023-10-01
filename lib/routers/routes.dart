import 'package:auto_route/auto_route.dart';
import 'package:korsun/screens/splash_page/page.dart';




part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
  ];
}

// dart run build_runner watch
// dart run build_runner build
