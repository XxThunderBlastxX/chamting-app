import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/textStyles/heading_text_style.dart';
import '../../comman/textStyles/text_style.dart';
import '../../comman/widgets/button/styled_button.dart';
import '../../comman/widgets/form_text_box/form_text_box.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class SignInView extends StatelessWidget {
  static const routeName = "/signin";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      header: const WindowsTitleBar(requiredBackButton: true),
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 8.0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.3,
            vertical: 0.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 21.0,
                ),
                child: Text(
                  "SignIn",
                  style: HeadingTextStyle(
                    size: TextSize.large,
                    weight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              FormTextBox(
                headerText: "Email",
                placeholderText: "Enter your Email",
                textController: emailController,
              ),
              FormTextBox(
                headerText: "Password",
                placeholderText: "Enter your Password",
                textController: passwordController,
              ),
              StyledButton(
                text: "Submit",
                color: Colors.teal,
                onClick: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
