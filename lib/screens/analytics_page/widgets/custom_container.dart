import 'package:flutter/material.dart';
import 'package:quad_timer/style.dart';

class CustomContainerBlueMain extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;
  final double? height;

  const CustomContainerBlueMain(
      {super.key, required this.text, this.border, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        color: BC.blue.withOpacity(0.2),
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: BS.med32,
        ),
      ),
    );
  }
}

class CustomContainerBlue extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;


  const CustomContainerBlue(
      {super.key, required this.text, this.border, this.width,});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 183,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        color: BC.blue.withOpacity(0.2),
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: BS.med32,
        ),
      ),
    );
  }
}

class CustomContainerBlueBig extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;
  final double? height;

  const CustomContainerBlueBig(
      {super.key, required this.text, this.border, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        color: BC.blue.withOpacity(0.2),
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: BS.med32,
        ),
      ),
    );
  }
}

class CustomContainerWhite extends StatelessWidget {
  final String? text;
  final BoxBorder? border;
  final double? width;

  const CustomContainerWhite({super.key, required this.text, this.border, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 183,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
      decoration: BoxDecoration(
        border: border,
      ),
      child: Center(
        child: Text(
          text ?? '00:00:00',
          style: BS.light30,
        ),
      ),
    );
  }
}
