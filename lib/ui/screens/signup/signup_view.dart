import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/user/user_bloc.dart';
import '../../../bloc/validator/validator_bloc.dart';
import '../../comman/textStyles/body_text_style.dart';
import '../../comman/textStyles/heading_text_style.dart';
import '../../comman/textStyles/text_style.dart';
import '../../comman/widgets/button/styled_button.dart';
import '../../comman/widgets/error_widget/error_snackbar.dart';
import '../../comman/widgets/form_text_box/form_text_box.dart';
import '../../comman/widgets/loading/loading.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';
import '../home/home_view.dart';

//SignUpView is to show signup screen
class SignUpView extends StatefulWidget {
  static const routeName = "/signup";

  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _rewritePassController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rewritePassController.dispose();
    _nameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: ScaffoldPage(
        padding: EdgeInsets.zero,
        header: const WindowsTitleBar(requiredBackButton: true),
        content: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLoadingState) {
              showDialog(
                  context: context, builder: (context) => LoadingWindow());
            } else if (state is SignUpSuccessState) {
              Navigator.of(context).pushReplacementNamed(HomeView.routeName);
            } else if (state is UserErrState) {
              Navigator.of(context).pop();
              showSnackbar(context, ErrSnackBar(err: state.errMsg));
            }
          },
          child: Padding(
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
                          validator: (_) => context.read<ValidatorBloc>().add(
                                NameValidatorEvent(_nameController.text),
                              ),
                        ),
                        state is NameValidatorState
                            ? Text(
                                state.err,
                                style: BodyTextStyle(
                                  size: TextSize.small,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        FormTextBox(
                          headerText: "Username",
                          placeholderText: "Enter your username",
                          textController: _userNameController,
                          validator: (_) => context.read<ValidatorBloc>().add(
                                UsernameValidatorEvent(
                                    _userNameController.text),
                              ),
                        ),
                        state is UsernameValidatorState
                            ? Text(
                                state.err,
                                style: BodyTextStyle(
                                  size: TextSize.small,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        FormTextBox(
                          headerText: "Email",
                          placeholderText: "Enter your email",
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
                          placeholderText: "Enter your password",
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
                        FormTextBox(
                          headerText: "Confirm Password",
                          placeholderText: "Confirm your password",
                          textController: _rewritePassController,
                          validator: (_) => context.read<ValidatorBloc>().add(
                                RewritePasswordEvent(
                                  _passwordController.text,
                                  _rewritePassController.text,
                                ),
                              ),
                        ),
                        state is ReWritePassState
                            ? Text(
                                state.err,
                                style: BodyTextStyle(
                                  size: TextSize.small,
                                  color: Colors.red,
                                ),
                              )
                            : const SizedBox(),
                        StyledButton(
                          text: "Submit",
                          color: Colors.teal,
                          onClick: () => context.read<UserBloc>().add(
                                SignUpSuccessEvent(
                                  email: _emailController.text,
                                  name: _nameController.text,
                                  userName: _userNameController.text,
                                  pass: _passwordController.text,
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
