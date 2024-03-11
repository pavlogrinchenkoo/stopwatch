
import 'package:flutter/material.dart';
import 'package:quad_timer/style.dart';

class SnackBarService {
  static const errorColor = Colors.red;
  static const okColor = Colors.green;

  static Future<void> showSnackBar(
      BuildContext context, String massage, bool error) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(massage, style: BS.med32.apply(color: BC.white)),
      backgroundColor: error ? errorColor :  okColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}