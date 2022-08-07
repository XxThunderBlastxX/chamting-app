import 'package:fluent_ui/fluent_ui.dart';

import '../../textStyles/body_text_style.dart';
import '../../textStyles/text_style.dart';

class ChatSetting extends StatelessWidget {
  final Function()? signOut;

  const ChatSetting({Key? key, this.signOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
        child: Row(
          children: [
            Text(
              "Signout",
              style: BodyTextStyle(
                size: TextSize.medium,
                weight: FontWeight.w600,
              ),
            ),
            IconButton(
              icon: const Icon(FluentIcons.sign_out),
              onPressed: () {},
            ),
          ],
        ),
        onPressed: signOut);
  }
}
