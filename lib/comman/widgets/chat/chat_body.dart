import 'package:fluent_ui/fluent_ui.dart';

import 'chat.dart';

class ChatBody extends NavigationBody {
  final int initialIndex;

  ChatBody({Key? key, required this.initialIndex})
      : super(
          key: key,
          index: initialIndex,
          children: [
            ScaffoldPage(
              header: const PageHeader(title: Text("ThunderBlast")),
              content: Chat(),
            ),
            ScaffoldPage(
              header: const PageHeader(
                title: Text("ThunderBlast"),
              ),
              content: Container(),
            ),
            ScaffoldPage(
              header: const PageHeader(
                title: Text("ThunderBlast"),
              ),
              content: Container(),
            ),
          ],
        );
}
