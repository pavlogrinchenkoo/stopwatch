import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quad_timer/generated/assets.gen.dart';
import 'package:quad_timer/screens/main_page/pages/ipad_page.dart';
import 'package:quad_timer/screens/main_page/pages/iphone_page.dart';
import 'package:quad_timer/screens/main_page/widgets/custom_timer.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_stream_builder.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

import '../bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController();
  final MainBloc bloc = MainBloc();

  @override
  void initState() {
    bloc.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (context, ScreenState state) {
          return (width < 600) ? IphonePage(bloc: bloc, controller: pageController) : IpadPage(bloc: bloc);
        });
  }
}
