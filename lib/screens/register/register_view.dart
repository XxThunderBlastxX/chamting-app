import 'package:chamting_app/comman/widgets/button/styled_button.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

//RegisterView to show the signup and signin button
class RegisterView extends StatelessWidget {
  static const routeName = "/register";

  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      header: const WindowsTitleBar(),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.18),
              child:
                  FlutterLogo(size: MediaQuery.of(context).size.height * 0.20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Column(
              children: [
                StyledButton(
                  text: "SignIn",
                  color: Colors.teal,
                ),
                StyledButton(
                  text: "SignUp",
                  color: Colors.teal,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
