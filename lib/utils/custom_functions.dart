import 'package:quad_timer/main.dart';

double getAdaptiveFontSize(double fontSizeInPixels) {
  final screenWidth = width;
  final screenHeight = height;

  final scaleFactor = (screenWidth + screenHeight) / 2;

  return fontSizeInPixels * scaleFactor / 1000;
}

double getAdaptivePadding(double paddingInPixels) {
  final screenWidth = width;
  final screenHeight = height;
  final scaleFactor = (screenWidth + screenHeight) / 2;
  return paddingInPixels * scaleFactor / 1033;
}
