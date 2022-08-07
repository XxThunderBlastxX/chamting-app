import 'package:fluent_ui/fluent_ui.dart';

import '../../../../constants/constants.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  const MessageTile({Key? key, required this.message, required this.sendByMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: sendByMe ? 0 : 24,
        right: sendByMe ? 24 : 0,
      ),
      alignment: sendByMe ? Alignment.centerRight : Alignment.bottomLeft,
      child: Container(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: sendByMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(23),
                  bottomLeft: Radius.circular(23),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(23),
                ),
          gradient: sendByMe
              ? LinearGradient(
                  colors: [Colors.teal, kTeal300],
                )
              : LinearGradient(
                  colors: [kTeal300, Colors.teal],
                ),
        ),
        child: Text(
          message,
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
