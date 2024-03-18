import 'package:flutter/material.dart';
import 'package:quad_timer/style.dart';

class CustomContainerBlueMain extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final BorderRadius? b;

  const CustomContainerBlueMain(
      {super.key, required this.text, this.border, this.width, this.height, this.b});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        borderRadius: b,
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
  final BorderRadius? b;

  const CustomContainerBlueBig(
      {super.key, required this.text, this.border, this.width, this.height, this.b});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: b,
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

class CustomContainerBlueMainPhone extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final BorderRadius? b;

  const CustomContainerBlueMainPhone(
      {super.key, required this.text, this.border, this.width, this.height, this.b});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: b,
        color: BC.blue.withOpacity(0.2),
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: BS.med16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomContainerBluePhone extends StatelessWidget {
  final String text;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final BorderRadius? b;


  const CustomContainerBluePhone(
      {super.key, required this.text, this.border, this.width, this.height, this.b,});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: b,
        color: BC.blue.withOpacity(0.2),
        border: border,
      ),
      child: Center(
        child: Text(
          text,
          style: BS.med16,
        ),
      ),
    );
  }
}

class CustomContainerWhitePhone extends StatelessWidget {
  final String? text;
  final BoxBorder? border;
  final double? width;

  const CustomContainerWhitePhone({super.key, required this.text, this.border, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 183,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        border: border,
      ),
      child: Center(
        child: Text(
          text ?? '00:00:00',
          style: BS.light16,
        ),
      ),
    );
  }
}


