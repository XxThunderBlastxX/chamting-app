import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

//RegisterView to show the signup and signin button
class RegisterView extends StatelessWidget {
  static const routeName = "/register";

  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      padding: EdgeInsets.all(0),
      header: WindowsTitleBar(),
    );
  }
}
