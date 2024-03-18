import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/generated/assets.gen.dart';
import 'package:quad_timer/routers/routes.dart';
import 'package:quad_timer/screens/main_page/bloc.dart';
import 'package:quad_timer/screens/main_page/widgets/custom_timer.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

class IphonePage extends StatelessWidget {
  final PageController controller;
  final MainBloc bloc;

  const IphonePage({super.key, required this.bloc, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AutoTabsRouter.pageView(
            routes: [
              CustomTimerIphoneRoute(
                  name: 'VAULT',
                  icon: Assets.images.vault.image(
                    width: 56,
                    height: 56,
                  )),
              CustomTimerIphoneRoute(
                  name: 'BEAM',
                  icon: Assets.images.beam.image(
                    width: 56,
                    height: 56,
                  )),
              CustomTimerIphoneRoute(
                  name: 'BARS',
                  icon: Assets.images.bars.image(
                    width: 56,
                    height: 56,
                  )),
              CustomTimerIphoneRoute(
                  name: 'FLOORS',
                  icon: Assets.images.floors.image(
                    width: 56,
                    height: 56,
                  )),
            ],
            builder: (context, child, _) {
              final tabsRouter = AutoTabsRouter.of(context);
              return Scaffold(
                body: child,
              );
            },
            // controller: controller,
            // scrollDirection: Axis.horizontal,
            // physics: const BouncingScrollPhysics(),
            // children: [
            //   CustomTimerIphone(
            //     icon: Assets.images.vault.image(
            //       width: 56,
            //       height: 56,
            //     ),
            //     name: 'VAULT',
            //   ),
            //   CustomTimerIphone(
            //     icon: Assets.images.beam.image(
            //       width: 56,
            //       height: 56,
            //     ),
            //     name: 'BEAM',
            //   ),
            //   CustomTimerIphone(
            //     icon: Assets.images.bars.image(
            //       width: 56,
            //       height: 56,
            //     ),
            //     name: 'BARS',
            //   ),
            //   CustomTimerIphone(
            //     icon: Assets.images.floors.image(
            //       width: 56,
            //       height: 56,
            //     ),
            //     name: 'FLOOR',
            //   ),
            //
            // ],
          ),
        ),
        Space.h16,
        SizedBox(
          width: 180,
          height: 40,
          child: CustomButtonBig(
            onTap: () => bloc.goToAnalytics(context),
            text: 'To Analytics',
            color: BC.blue,
          ),
        ),
        Space.h32,
      ],
    ));
    ;
  }
}
