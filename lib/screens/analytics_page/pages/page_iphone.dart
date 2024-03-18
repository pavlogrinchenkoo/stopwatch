import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quad_timer/screens/analytics_page/bloc.dart';
import 'package:quad_timer/screens/analytics_page/page.dart';
import 'package:quad_timer/screens/analytics_page/widgets/custom_container.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

class PageIphone extends StatelessWidget {
  final AnalyticsBloc bloc;
  final ScreenState state;

  const PageIphone({super.key, required this.bloc, required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Space.h32,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Space.w32,
            const Spacer(),
            Text('Analytics', style: BS.reg48),
            const Spacer(),
            PopupMenuButton(
                icon: Icon(Icons.more_vert, color: BC.black, size: 32),
                color: BC.white,
                shadowColor: BC.black,
                surfaceTintColor: BC.white,
                padding: EdgeInsets.zero,
                offset: const Offset(-32, 22),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () => bloc.downloadFile(context),
                      child:  Row(
                        children: [
                          Text('Download', style: BS.light16,),
                          Space.w8,
                          Icon(Icons.download, color: BC.black, size: 16,),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => bloc.shareFile(context),
                      child: Row(
                        children: [
                          Text('Share', style: BS.light16,),
                          Space.w8,
                          Icon(Icons.share, color: BC.black, size: 16,),
                        ],
                      ),
                    ),
                  ];
                })
          ],
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BRadius.r16,
            border: Border.all(color: BC.black),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  CustomContainerBlueMainPhone(
                    width: 123,
                    text: 'Average Value',
                    b: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                    ),
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                  ),
                  CustomContainerBluePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 123,
                    text: 'Vault',
                  ),
                  CustomContainerBluePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 123,
                    text: 'Beam',
                  ),
                  CustomContainerBluePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 123,
                    text: 'Bars',
                  ),
                  CustomContainerBluePhone(
                    b: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                    ),
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 123,
                    text: 'Floor',
                  ),
                ],
              ),
              Column(
                children: [
                  CustomContainerBlueMainPhone(
                    width: 110,
                    text: 'Start to Cued',
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.vaultCue,
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.beamCue,
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.barsCue,
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      right: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.floorCue,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomContainerBlueMainPhone(
                    width: 110,
                    text: 'Start to Сlear',
                    b: const BorderRadius.only(
                      topRight: Radius.circular(16),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.vaultClear,
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.beamClear,
                  ),
                  CustomContainerWhitePhone(
                    border: Border(
                      bottom: BorderSide(
                        color: BC.black,
                        width: 1,
                      ),
                    ),
                    width: 110,
                    text: state.barsClear,
                  ),
                  CustomContainerWhitePhone(
                    width: 110,
                    text: state.floorClear,
                  ),
                ],
              ),
            ],
          ),
        ),
        Space.h24,
        const Spacer(),
        SizedBox(
          width: 100,
          height: 40,
          child: CustomButtonBig(
            text: 'Clear',
            onTap: () => bloc.removeTime(),
            color: BC.gray,
          ),
        ),
        Space.h32,
        SizedBox(
          width: 180,
          height: 40,
          child: CustomButtonBig(
            text: 'To Timers',
            onTap: () => context.router.pop(),
            color: BC.blue,
          ),
        ),
        Space.h32,
      ],
    ));
  }
}
