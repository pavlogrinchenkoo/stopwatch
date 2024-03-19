import 'package:flutter/material.dart';

import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/custom_functions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.onTap, super.key, this.text, this.color});

  final String? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BRadius.r90,
      color: color,
      child: InkWell(
          borderRadius: BRadius.r90,
          onTap: onTap,
          child: Container(
            height: getAdaptivePadding(58),
            width: getAdaptivePadding(155),
            padding: EdgeInsets.symmetric(vertical: getAdaptivePadding(10)),
            child: Center(
                child: Text(text ?? '',
                    style: BS.med32.copyWith(color: BC.white))),
          )),
    );
  }
}

class CustomButtonPhone extends StatelessWidget {
  const CustomButtonPhone({this.onTap, super.key, this.text, this.color});

  final String? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BRadius.r90,
      color: color,
      child: InkWell(
          borderRadius: BRadius.r90,
          onTap: onTap,
          child: Container(
            height: getAdaptivePadding(40),
            width: getAdaptivePadding(100),
            padding: EdgeInsets.symmetric(vertical: getAdaptivePadding(10)),
            child: Center(
                child: Text(text ?? '',
                    style: BS.med16.copyWith(color: BC.white))),
          )),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({this.onTap, super.key, this.text, this.color});

  final Widget? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BRadius.r90,
      color: color,
      child: InkWell(
          borderRadius: BRadius.r90,
          onTap: onTap,
          child: Container(
            height: getAdaptivePadding(58),
            width: getAdaptivePadding(155),
            padding: EdgeInsets.symmetric(vertical: getAdaptivePadding(10)),
            child: Center(child: text),
          )),
    );
  }
}

class CustomButtonCue extends StatelessWidget {
  const CustomButtonCue({this.onTap, super.key, this.text, this.color});

  final String? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BRadius.r90,
      color: color,
      child: InkWell(
          borderRadius: BRadius.r90,
          onTap: onTap,
          child: SizedBox(
            height: getAdaptivePadding(58),
            width: getAdaptivePadding(155),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cued', style: BS.med16.copyWith(color: BC.white)),
                Text(text ?? '', style: BS.med20.copyWith(color: BC.white)),
              ],
            )),
          )),
    );
  }
}

class CustomButtonBig extends StatelessWidget {
  const CustomButtonBig({this.onTap, super.key, this.text, this.color});

  final String? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BRadius.r90,
      color: color,
      child: InkWell(
          borderRadius: BRadius.r90,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Center(
                child: Text(text ?? '',
                    style: BS.med24.copyWith(color: BC.white))),
          )),
    );
  }
}
