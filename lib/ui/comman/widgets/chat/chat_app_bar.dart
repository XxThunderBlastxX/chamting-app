import 'package:fluent_ui/fluent_ui.dart';

import '../../textStyles/heading_text_style.dart';
import '../../textStyles/text_style.dart';

class ChatAppBar extends NavigationAppBar {
  ChatAppBar()
      : super(
          automaticallyImplyLeading: false,
          height: 45,
          title: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Text(
              "Chamting",
              style: HeadingTextStyle(
                size: TextSize.large,
                weight: FontWeight.w600,
              ),
            ),
          ),
        );
}
