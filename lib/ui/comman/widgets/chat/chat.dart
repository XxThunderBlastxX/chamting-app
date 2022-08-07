import 'package:fluent_ui/fluent_ui.dart';

import '../../../../constants/constants.dart';
import 'chat_tile.dart';

class Chat extends StatelessWidget {
  final TextEditingController chatTextController = TextEditingController();

  Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const MessageTile(message: "message", sendByMe: false),
            const MessageTile(message: "message", sendByMe: true),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.0,
                      child: TextBox(
                        padding: const EdgeInsets.all(8.0),
                        placeholder: "Message",
                        placeholderStyle: const TextStyle(fontSize: 15.0),
                        controller: chatTextController,
                        decoration: const BoxDecoration(color: kTeal50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  IconButton(
                    icon: const Icon(FluentIcons.send),
                    onPressed: () {},
                    style: ButtonStyle(
                      iconSize: ButtonState.all(19.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
