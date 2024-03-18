
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quad_timer/style.dart';
import 'package:quad_timer/utils/spaces.dart';

import 'custom_buttom.dart';

class CustomShowDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? buttonOne;
  final String? buttonTwo;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Widget? text;

  const CustomShowDialog(
      {super.key,
      this.title,
      this.content,
      this.buttonOne,
      this.buttonTwo,
      this.onTapOne,
      this.onTapTwo,
      this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return (width < 600) ? AlterPhone(
      title: title,
      content: content,
      buttonOne: buttonOne,
      buttonTwo: buttonTwo,
      onTapOne: onTapOne,
      onTapTwo: onTapTwo,
      text: text,
    ) : AlterIpad(
      title: title,
      content: content,
      buttonOne: buttonOne,
      buttonTwo: buttonTwo,
      onTapOne: onTapOne,
      onTapTwo: onTapTwo,
      text: text,
    );
  }
}


class AlterPhone extends StatelessWidget {
  final String? title;
  final String? content;
  final String? buttonOne;
  final String? buttonTwo;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Widget? text;
  const AlterPhone({super.key, this.title, this.content, this.buttonOne, this.buttonTwo, this.onTapOne, this.onTapTwo, this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BRadius.r16,
      ),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? "", style: BS.med24, textAlign: TextAlign.center),
          Space.h16,
          (text != null)
              ? Row(
            children: [
              Space.w8,
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 45,
                  child: text ?? const SizedBox()),
            ],
          )
              : const SizedBox(),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (buttonOne != null)
                ? CustomButtonPhone(
              text: buttonOne ?? '',
              onTap: onTapOne,
              color: BC.red,
            )
                : const SizedBox(),
            Space.w22,
            (buttonTwo != null)
                ? CustomButtonPhone(
              text: buttonTwo,
              onTap: onTapTwo,
              color: BC.blue,
            )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}


class AlterIpad extends StatelessWidget {
  final String? title;
  final String? content;
  final String? buttonOne;
  final String? buttonTwo;
  final Function()? onTapOne;
  final Function()? onTapTwo;
  final Widget? text;
  const AlterIpad({super.key, this.title, this.content, this.buttonOne, this.buttonTwo, this.onTapOne, this.onTapTwo, this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BRadius.r16,
      ),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? "", style: BS.med32, textAlign: TextAlign.center),
          (text != null)
              ? Row(
            children: [
              Space.w8,
              SizedBox(
                  width: 400,
                  height: 82,
                  child: text ?? const SizedBox()),
            ],
          )
              : const SizedBox(),
        ],
      ),
      content:
      Text(content ?? "", style: BS.med32, textAlign: TextAlign.center),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (buttonOne != null)
                ? CustomButton(
              text: buttonOne ?? '',
              onTap: onTapOne,
              color: BC.red,
            )
                : const SizedBox(),
            Space.w22,
            (buttonTwo != null)
                ? CustomButton(
              text: buttonTwo,
              onTap: onTapTwo,
              color: BC.blue,
            )
                : const SizedBox(),
          ],
        )
      ],
    );
  }
}

