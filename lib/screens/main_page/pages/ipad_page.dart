import 'package:flutter/material.dart';
import 'package:quad_timer/generated/assets.gen.dart';
import 'package:quad_timer/screens/main_page/bloc.dart';
import 'package:quad_timer/screens/main_page/widgets/custom_timer.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_functions.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

class IpadPage extends StatelessWidget {
  final MainBloc bloc;
  const IpadPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      CustomTimer(
                        icon: Assets.images.vault.image(
                          width: getAdaptivePadding(56),
                          height: getAdaptivePadding(56),

                        ),
                        name: 'VAULT',
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 2,
                        color: BC.darkWhite,
                      ),
                      CustomTimer(
                        icon: Assets.images.beam.image(
                          width: getAdaptivePadding(56),
                          height: getAdaptivePadding(56),
                        ),
                        name: 'BEAM',
                      ),
                    ],
                  ),
                  Container(
                    width: 4,
                    color: BC.darkGray,
                  ),
                  Column(
                    children: [
                      CustomTimer(
                        icon: Assets.images.bars.image(
                          width: getAdaptivePadding(56),
                          height: getAdaptivePadding(56),
                        ),
                        name: 'BARS',
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 2,
                        color: BC.darkWhite,
                      ),

                      CustomTimer(
                        icon: Assets.images.floors.image(
                          width: getAdaptivePadding(56),
                          height: getAdaptivePadding(56),
                        ),
                        name: 'FLOOR',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 4,
              color: BC.darkGray,
            ),
            Space.h32,
            SizedBox(
              width: getAdaptivePadding(280),
              height: getAdaptivePadding(62),
              child: CustomButtonBig(
                onTap: () => bloc.goToAnalytics(context),
                text: 'To Analytics',
                color: BC.blue,
              ),
            ),
            Space.h24,
          ],
        ));;
  }
}
