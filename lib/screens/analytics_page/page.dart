import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_stream_builder.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';
import 'bloc.dart';
import 'widgets/custom_container.dart';

@RoutePage()
class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  final AnalyticsBloc bloc = AnalyticsBloc();

  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return state.loading
              ? Center(
                  child: CircularProgressIndicator(
                  color: BC.blue,
                  strokeWidth: 3,
                ))
              : CustomScaffold(
                  body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Space.h32,
                    Text('Analytics', style: BS.med120),
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
                    Space.h32,
                    SizedBox(
                      width: 260,
                      height: 86,
                      child: CustomButtonBig(
                        text: 'To Timers',
                        onTap: () => context.router.pop(),
                        color: BC.blue,
                      ),
                    ),
                  ],
                ));
        });
  }
}
