import 'package:chamting_app/comman/widgets/chat/chat_app_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/widgets/chat/chat_body.dart';
import '../../comman/widgets/chat/chat_pane.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class HomeView extends StatefulWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _initialIndex = 0;

  FlyoutController flyoutController = FlyoutController();

  @override
  void dispose() {
    flyoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      header: const WindowsTitleBar(),
      content: NavigationView(
        appBar: ChatAppBar(),
        pane: ChatPane(
          initialIndex: _initialIndex,
          changeIndexFunc: (newIndex) =>
              setState(() => _initialIndex = newIndex),
        ),
        content: ChatBody(initialIndex: _initialIndex),
      ),
    );
  }
}
