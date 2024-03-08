import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quad_timer/screens/main_page/widgets/custom_timer.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_stream_builder.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';

import 'bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

  @override
  void initState() {
    bloc.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (context, ScreenState state) {
          return CustomScaffold(
              body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 30, top: 24, bottom: 24),
                      child: Column(
                        children: [
                          const CustomTimer(
                            name: 'VAULT',
                          ),
                          Space.h32,
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 2,
                            color: BC.darkWhite,
                          ),
                          Space.h32,
                          const CustomTimer(
                            name: 'BEAM',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 4,
                      color: BC.darkGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 40, top: 24, bottom: 24),
                      child: Column(
                        children: [
                          const CustomTimer(
                            name: 'BARS',
                          ),
                          Space.h32,
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 2,
                            color: BC.darkWhite,
                          ),
                          Space.h32,
                          const CustomTimer(
                            name: 'FLOOR',
                          ),
                        ],
                      ),
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
                width: 280,
                height: 86,
                child: CustomButtonBig(
                  onTap: () => bloc.goToAnalytics(context),
                  text: 'To Analytics',
                  color: BC.blue,
                ),
              ),
              Space.h32,
            ],
          ));
        });
  }
}
