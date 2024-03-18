import 'package:flutter/material.dart';
import 'package:quad_timer/generated/assets.gen.dart';
import 'package:quad_timer/style.dart';



class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {this.appBar, required this.body, this.bottomNavigationBar, super.key});

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BC.white,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: height < 600 ? body : SafeArea(child: body),
    );
  }
}
