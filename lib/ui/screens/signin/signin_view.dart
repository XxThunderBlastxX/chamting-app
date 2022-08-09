import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/user/user_bloc.dart';
import '../../../bloc/validator/validator_bloc.dart';
import '../../comman/textStyles/body_text_style.dart';
import '../../comman/textStyles/heading_text_style.dart';
import '../../comman/textStyles/text_style.dart';
import '../../comman/widgets/button/styled_button.dart';
import '../../comman/widgets/error_snackbar/error_snackbar.dart';
import '../../comman/widgets/form_text_box/form_text_box.dart';
import '../../comman/widgets/loading/loading.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';
import '../home/home_view.dart';

//SignInView is to show signin screen
class SignInView extends StatefulWidget {
  static const routeName = "/signin";

  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _signinFormKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) async {
          if (state is UserLoadingState) {
            showDialog(context: context, builder: (context) => LoadingWindow());
          } else if (state is SignInSuccessState) {
            Navigator.of(context).pushReplacementNamed(HomeView.routeName);
          } else if (state is UserErrState) {
            Navigator.of(context).pop();
            showSnackbar(context, ErrSnackBar(err: state.errMsg));
          }
        },
        child: ScaffoldPage(
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
              child: BlocBuilder<ValidatorBloc, ValidatorState>(
                builder: (context, state) {
                  return Form(
                    key: _signinFormKey,
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
                          textController: _emailController,
                          validator: (_) => context.read<ValidatorBloc>().add(
                                EmailValidatorEvent(_emailController.text),
                              ),
                        ),
                        state is EmailValidatorState
                            ? Text(
                                state.err,
                                style: BodyTextStyle(
                                  size: TextSize.small,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        FormTextBox(
                          headerText: "Password",
                          placeholderText: "Enter your Password",
                          textController: _passwordController,
                          validator: (_) => context.read<ValidatorBloc>().add(
                                PasswordValidatorEvent(
                                    _passwordController.text),
                              ),
                        ),
                        state is PasswordValidatorState
                            ? Text(
                                state.err,
                                style: BodyTextStyle(
                                  size: TextSize.small,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: StyledButton(
                            text: "Submit",
                            color: Colors.teal,
                            onClick: () => context.read<UserBloc>().add(
                                  SignInSubmitEvent(
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
