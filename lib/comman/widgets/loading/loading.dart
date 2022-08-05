import 'package:fluent_ui/fluent_ui.dart';

import '../../textStyles/heading_text_style.dart';
import '../../textStyles/text_style.dart';

class LoadingWindow extends ContentDialog {
  LoadingWindow({Key? key})
      : super(
          key: key,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Loading...",
                style: HeadingTextStyle(
                  size: TextSize.medium,
                  weight: FontWeight.w600,
                ),
              ),
              ProgressRing(
                activeColor: Colors.teal,
              )
            ],
          ),
        );
}
