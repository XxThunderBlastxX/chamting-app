import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class HomeView extends StatelessWidget {
  static const routeName = "/home";

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: WindowsTitleBar(),
      content: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
