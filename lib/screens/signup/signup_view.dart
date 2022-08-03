import 'package:fluent_ui/fluent_ui.dart';

import '../../comman/textStyles/heading_text_style.dart';
import '../../comman/textStyles/text_style.dart';
import '../../comman/widgets/button/styled_button.dart';
import '../../comman/widgets/form_text_box/form_text_box.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';

class SignUpView extends StatelessWidget {
  static const routeName = "/signup";

  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.zero,
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
          child: Form(
            key: _signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 21.0,
                  ),
                  child: Text(
                    "SignUp",
                    style: HeadingTextStyle(
                      size: TextSize.large,
                      weight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                FormTextBox(
                  headerText: "Name",
                  placeholderText: "Enter your name",
                  textController: _nameController,
                ),
                FormTextBox(
                  headerText: "Username",
                  placeholderText: "Enter your username",
                  textController: _passwordController,
                ),
                FormTextBox(
                  headerText: "Email",
                  placeholderText: "Enter your email",
                  textController: _emailController,
                ),
                FormTextBox(
                  headerText: "Password",
                  placeholderText: "Enter your password",
                  textController: _passwordController,
                ),
                FormTextBox(
                  headerText: "Rewrite - Password",
                  placeholderText: "Enter your password again",
                  textController: _passwordController,
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
      ),
    );
  }
}
