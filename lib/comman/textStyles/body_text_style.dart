import 'package:flutter/material.dart';

import 'text_style.dart';

//Inherited from BaseTextStyle used to style any body text
class BodyTextStyle extends BaseTextStyle {
  BodyTextStyle(
      {required TextSize size,
      Color color = Colors.black,
      FontWeight? weight,
      double? letterSpacing})
      : super(
            letterSpacing: letterSpacing,
            color: color,
            weight: weight,
            size: size,
            fontSizeMap: {
              TextSize.extraLarge: 20.0,
              TextSize.large: 18.0,
              TextSize.medium: 15.0,
              TextSize.small: 14.0
            });
}
