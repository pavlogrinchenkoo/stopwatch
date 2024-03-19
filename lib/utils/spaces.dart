import 'package:flutter/material.dart';

import 'custom_functions.dart';

class Space {
  static Widget get w167 =>  _SpaceWidget(width: getAdaptivePadding(167));

  static Widget get w52 =>  _SpaceWidget(width: getAdaptivePadding(52));

  static Widget get w32 =>  _SpaceWidget(width: getAdaptivePadding(32));

  static Widget get w24 =>  _SpaceWidget(width: getAdaptivePadding(24));

  static Widget get w22 =>  _SpaceWidget(width: getAdaptivePadding(22));

  static Widget get w20 =>  _SpaceWidget(width:   getAdaptivePadding(20));

  static Widget get w16 =>  _SpaceWidget(width: getAdaptivePadding(16));

  static Widget get w8 =>  _SpaceWidget(width: getAdaptivePadding(8));

  static Widget get w4 =>  _SpaceWidget(width: getAdaptivePadding(4));

  static Widget get h140 =>  _SpaceWidget(height: getAdaptivePadding(140));

  static Widget get h96 =>  _SpaceWidget(height: getAdaptivePadding(96));

  static Widget get h32 =>  _SpaceWidget(height:  getAdaptivePadding(32));

  static Widget get h24 =>  _SpaceWidget(height:  getAdaptivePadding(24));

  static Widget get h20 =>  _SpaceWidget(height:  getAdaptivePadding(20));

  static Widget get h16 =>  _SpaceWidget(height:  getAdaptivePadding(16));

  static Widget get h8 =>  _SpaceWidget(height:  getAdaptivePadding(8));
}

class _SpaceWidget extends StatelessWidget {
  const _SpaceWidget({this.width = 0, this.height = 0});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
