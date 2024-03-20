import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quad_timer/style.dart';
import 'package:window_size/window_size.dart';

import 'generated/l10n.dart';
import 'routers/routes.dart';
import 'utils/portrait_modeM_mxin.dart';

double height = 0;
double width = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowMaxSize(const Size(1400, 1024));
    setWindowMinSize(const Size(1400, 1024));
  }

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext buildContext) {
    height = MediaQuery.of(buildContext).size.height;
    width = MediaQuery.of(buildContext).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: BC.white,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
