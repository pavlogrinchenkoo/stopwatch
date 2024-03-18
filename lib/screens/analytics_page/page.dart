import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_stream_builder.dart';
import 'package:quad_timer/utils/spaces.dart';
import 'package:quad_timer/widgets/custom_buttom.dart';
import 'package:quad_timer/widgets/custom_scaffold.dart';
import 'bloc.dart';
import 'pages/page_ipad.dart';
import 'pages/page_iphone.dart';
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
    final width = MediaQuery.of(context).size.width;
    return CustomStreamBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenState state) {
          return state.loading
              ? Center(
                  child: CircularProgressIndicator(
                  color: BC.blue,
                  strokeWidth: 3,
                ))
              : (width < 600) ? PageIphone(bloc: bloc, state: state) : PageIpad(
                  bloc: bloc,
                  state: state,
          );
        });
  }
}

class CustomTwoButton extends StatelessWidget {
  final Function()? onShare;
  final Function()? onDownload;

  const CustomTwoButton({super.key, this.onShare, this.onDownload});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BRadius.r16,
        border: Border.all(color: BC.black),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onShare,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Share',
                      style: BS.med16,
                    ),
                    Space.w8,
                    const Icon(Icons.share),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            width: 132,
            color: BC.black,
          ),
          InkWell(
            onTap: onDownload,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Download',
                      style: BS.med16,
                    ),
                    Space.w8,
                    const Icon(Icons.download),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
