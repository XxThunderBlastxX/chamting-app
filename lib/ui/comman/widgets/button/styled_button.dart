import 'package:flutter/material.dart';

import '../../textStyles/body_text_style.dart';
import '../../textStyles/text_style.dart';

//StyledButton is a clickable button
class StyledButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final Function()? onClick;

  const StyledButton({
    Key? key,
    this.text = 'Text',
    this.color = Colors.teal,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      fillColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.5),
        side: const BorderSide(color: Colors.black26),
      ),
      child: Text(
        text as String,
        style: BodyTextStyle(
          size: TextSize.medium,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
