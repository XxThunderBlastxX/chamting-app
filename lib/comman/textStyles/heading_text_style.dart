import 'package:flutter/material.dart';

import 'text_style.dart';

//Inherited from BaseTextStyle used to style Heading text
class HeadingTextStyle extends BaseTextStyle {
  HeadingTextStyle(
      {required TextSize size,
      Color color = Colors.black,
      FontWeight? weight = FontWeight.bold,
      double? letterSpacing})
      : super(
            color: color,
            weight: weight,
            letterSpacing: letterSpacing,
            size: size,
            fontSizeMap: {
              TextSize.extraLarge: 32.0,
              TextSize.large: 25.0,
              TextSize.medium: 24.0,
              TextSize.small: 20.0
            });
}
