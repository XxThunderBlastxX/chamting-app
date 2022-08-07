import 'package:fluent_ui/fluent_ui.dart';

import '../../../../constants/constants.dart';

class ChatPane extends NavigationPane {
  final int? initialIndex;
  final Function(int)? changeIndexFunc;

  ChatPane({this.initialIndex, this.changeIndexFunc})
      : super(
          displayMode: PaneDisplayMode.auto,
          selected: initialIndex,
          onChanged: changeIndexFunc,
          header: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextBox(
              placeholder: "Search",
              decoration: BoxDecoration(color: kTeal50),
            ),
          ),
          items: [
            PaneItemSeparator(),
            PaneItem(
              selectedTileColor: ButtonState.all(kTeal100),
              icon: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 15,
              ),
              title: const Text('ThunderBlast'),
              infoBadge: const InfoBadge(
                source: Text('2'),
              ),
            ),
            PaneItem(
              selectedTileColor: ButtonState.all(kTeal100),
              icon: const Icon(FluentIcons.people),
              title: const Text('ThunderBlast'),
              infoBadge: const InfoBadge(
                source: Text('9'),
              ),
            ),
          ],
          menuButton: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(FluentIcons.add_friend),
              iconButtonMode: IconButtonMode.large,
              onPressed: () {},
              style: ButtonStyle(
                iconSize: ButtonState.all(16.0),
                backgroundColor: ButtonState.all(kTeal50),
                elevation: ButtonState.all(1.5),
              ),
            ),
          ),
          footerItems: [
            PaneItemSeparator(),
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text("Setting"),
            )
          ],
        );
}
