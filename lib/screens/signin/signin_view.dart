import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class SignInView extends StatelessWidget {
  static const routeName = "/signin";
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.all(0),
      header: const WindowsTitleBar(requiredBackButton: true),
      content: Column(
        children: [
          Text("SignIn"),
        ],
      ),
    );
  }
}
