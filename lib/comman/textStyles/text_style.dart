import 'package:flutter/material.dart';

enum TextSize { extraLarge, large, medium, small }

//Used to define text style
abstract class BaseTextStyle extends TextStyle {
  BaseTextStyle(
      {required TextSize size,
      required Map<TextSize, double> fontSizeMap,
      Color color = Colors.black,
      FontWeight? weight,
      double? letterSpacing})
      : super(
            color: color,
            fontWeight: weight,
            letterSpacing: letterSpacing,
            fontSize: fontSizeMap[size]);
}
