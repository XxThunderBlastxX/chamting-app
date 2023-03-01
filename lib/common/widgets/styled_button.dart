import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/app/theme/theme.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const StyledButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 25.w,
        minHeight: 42.h,
      ),
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      fillColor: Colors.purple.shade100,
      padding: const EdgeInsets.all(13),
      textStyle: theme.textTheme.bodySmall,
      child: Text(text),
    );
  }
}
