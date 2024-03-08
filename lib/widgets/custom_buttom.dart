import 'package:flutter/material.dart';

import 'package:quad_timer/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({ this.onTap, super.key, this.text, this.color});

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
            height: 58,
            width: 155,
            padding: const EdgeInsets.symmetric( vertical: 10),
            child: Center(child: Text(text ?? '', style: BS.med32.copyWith(color: BC.white))),
          )),
    );
  }
}

class CustomButtonCue extends StatelessWidget {
  const CustomButtonCue({ this.onTap, super.key, this.text, this.color});

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
            height: 58,
            width: 155,
            padding: const EdgeInsets.symmetric( vertical: 10),
            child: Center(child: Text(text ?? '', style: BS.med24.copyWith(color: BC.white))),
          )),
    );
  }
}

class CustomButtonBig extends StatelessWidget {
  const CustomButtonBig({ this.onTap, super.key, this.text, this.color});

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
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 29),
            child: Center(child: Text(text ?? '', style: BS.med24.copyWith(color: BC.white))),
          )),
    );
  }
}