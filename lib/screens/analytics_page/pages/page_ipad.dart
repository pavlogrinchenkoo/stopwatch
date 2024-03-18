import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/screens/analytics_page/bloc.dart';
import 'package:quad_timer/screens/analytics_page/page.dart';
import 'package:quad_timer/screens/analytics_page/widgets/custom_container.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

class PageIpad extends StatelessWidget {
  final AnalyticsBloc bloc;
  final ScreenState state;

  const PageIpad({super.key, required this.bloc, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.h32,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (state.isShowButton) ? Space.w167 : Space.w32,
                  const Spacer(),
                  Text('Analytics', style: BS.med120),
                  const Spacer(),
                  if (state.isShowButton)
                    Builder(builder: (context) {
                      return CustomTwoButton(
                        onDownload: () => bloc.downloadFile(context),
                        onShare: () => bloc.shareFile(context),
                      );
                    }),
                  Space.w8,
                  InkWell(
                    onTap: () => bloc.showButton(),
                    child: Icon(Icons.more_vert,
                        color: BC.black, size: 32),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BRadius.r16,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 72, vertical: 54),
                decoration: BoxDecoration(
                  borderRadius: BRadius.r16,
                  border: Border.all(color: BC.black),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomContainerBlueMain(
                          text: 'Average Value',
                          width: 300,
                          b: const BorderRadius.only(topLeft: Radius.circular(16)),
                          border: Border(
                              bottom: BorderSide(
                                color: BC.black,
                              ),
                              right: BorderSide(
                                color: BC.black,
                              )),
                        ),
                        CustomContainerBlue(
                          text: 'Vault',
                          width: 200,
                          border: Border(
                              bottom: BorderSide(
                                color: BC.black,
                              ),
                              right: BorderSide(
                                color: BC.black,
                              )),
                        ),
                        CustomContainerBlue(
                          text: 'Beam',
                          border: Border(
                              bottom: BorderSide(
                                color: BC.black,
                              ),
                              right: BorderSide(
                                color: BC.black,
                              )),
                        ),
                        CustomContainerBlue(
                          text: 'Bars',
                          border: Border(
                            bottom: BorderSide(
                              color: BC.black,
                            ),
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerBlueMain(
                          text: 'Floor',
                          width: 185,
                          b: const BorderRadius.only(topRight: Radius.circular(16)),
                          border: Border(
                              bottom: BorderSide(
                                color: BC.black,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomContainerBlueBig(
                          text: 'Start to Cued',
                          width: 300,
                          border: Border(
                              right: BorderSide(
                                color: BC.black,
                              ),
                              bottom: BorderSide(
                                color: BC.black,
                              )),
                        ),
                        CustomContainerWhite(
                          text: state.vaultCue,
                          border: Border(
                            bottom: BorderSide(
                              color: BC.black,
                            ),
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.beamCue,
                          border: Border(
                            bottom: BorderSide(
                              color: BC.black,
                            ),
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.barsCue,
                          border: Border(
                            bottom: BorderSide(
                              color: BC.black,
                            ),
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.floorCue,
                          width: 185,
                          border: Border(
                            bottom: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomContainerBlueBig(
                          text: 'Start to Сlear',
                          width: 300,
                          b:  const BorderRadius.only(bottomLeft: Radius.circular(16)),
                          border: Border(
                              right: BorderSide(
                                color: BC.black,
                              )),
                        ),
                        CustomContainerWhite(
                          text: state.vaultClear,
                          border: Border(
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.beamClear,
                          border: Border(
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.barsClear,
                          border: Border(
                            right: BorderSide(
                              color: BC.black,
                            ),
                          ),
                        ),
                        CustomContainerWhite(
                          text: state.floorClear,
                          width: 185,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: CustomButtonBig(
                text: 'Clear',
                onTap: () => bloc.removeTime(),
                color: BC.gray,
              ),
            ),
            Space.h32,
            SizedBox(
              width: 260,
              height: 62,
              child: CustomButtonBig(
                text: 'To Timers',
                onTap: () => context.router.pop(),
                color: BC.blue,
              ),
            ),
          ],
        ));
  }
}
