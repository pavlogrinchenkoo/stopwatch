import 'package:flutter/material.dart';

class ThemeColors {
  static const Color green = Color(0xff009D48);
  static const Color white = Color(0xffffffff);
  static const Color red = Color(0xffBD3636);
  static const Color blue = Color(0xff3662FF);
  static const Color gray = Color(0xff898989);
  static const Color orange = Color(0xffE97E00);
  static const Color darkGray = Color(0xff808080);
  static const Color darkWhite = Color(0xffDBDBDB);
  static const Color black = Color(0xff000000);

}

abstract class BC {
  static Color get green => ThemeColors.green;
  static Color get white => ThemeColors.white;
  static Color get red => ThemeColors.red;
  static Color get blue => ThemeColors.blue;
  static Color get gray => ThemeColors.gray;
  static Color get orange => ThemeColors.orange;
  static Color get darkGray => ThemeColors.darkGray;
  static Color get darkWhite => ThemeColors.darkWhite;
  static Color get black => ThemeColors.black;
}

abstract class BS {

  static TextStyle get med120 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 120,
    fontWeight: FontWeight.w500,
    height: 1.175,
    letterSpacing: 0,
  );


  static TextStyle get med32 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.1875,
    letterSpacing: 0,
  );

  static TextStyle get med24 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.1667,
    letterSpacing: 0,
  );

  static TextStyle get med16 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.0,
  );

  static TextStyle get reg90 => const   TextStyle(
    fontFamily: 'Roboto',
    fontSize: 90,
    fontWeight: FontWeight.w400,
    height: 1.175,
    letterSpacing: 0,
  );

  static TextStyle get reg48 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1.17,
    letterSpacing: 0,
  );

  static TextStyle get light32 => const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 30,
    fontWeight: FontWeight.w300,
    height: 1.188,
    letterSpacing: 0,
  );
}

abstract class BDuration {
  static Duration get d200 => const Duration(milliseconds: 200);
}

abstract class BRadius {
  static BorderRadius get r90 => const BorderRadius.all(Radius.circular(90));
  static BorderRadius get r16 => const BorderRadius.all(Radius.circular(16));
}

abstract class BShadow {
  static List<BoxShadow> get light => [
        BoxShadow(
            color: BC.green.withOpacity(0.1),
            blurRadius: 60,
            offset: const Offset(0, 2))
      ];
}
