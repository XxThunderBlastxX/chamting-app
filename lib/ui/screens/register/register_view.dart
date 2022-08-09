import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/connectivity/connectivity_bloc.dart';
import '../../../constants/constants.dart';
import '../../comman/widgets/button/styled_button.dart';
import '../../comman/widgets/error_widget/internet_err.dart';
import '../../comman/widgets/windows_title_bar/windows_title_bar.dart';
import '../signin/signin_view.dart';
import '../signup/signup_view.dart';

//RegisterView to show the signup and signin button
class RegisterView extends StatefulWidget {
  static const routeName = "/register";

  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: const EdgeInsets.all(0),
      header: const WindowsTitleBar(),
      content: SingleChildScrollView(
        child: BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state is ConnectivityTrue) {
              setState(() => internetConnected = true);
            } else if (state is ConnectivityErr) {
              setState(() => internetConnected = false);
            }
          },
          child: BlocProvider<ConnectivityBloc>.value(
            value: BlocProvider.of<ConnectivityBloc>(context)
              ..add(ConnectivityCheckEvent()),
            child: Stack(
              children: [
                internetConnected == false
                    ? const InternetInfoBar()
                    : const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.18),
                      child: FlutterLogo(
                          size: MediaQuery.of(context).size.height * 0.20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Column(
                      children: [
                        StyledButton(
                          text: "SignIn",
                          color: Colors.teal,
                          onClick: () => Navigator.of(context)
                              .pushNamed(SignInView.routeName),
                        ),
                        StyledButton(
                          text: "SignUp",
                          color: Colors.teal,
                          onClick: () => Navigator.of(context)
                              .pushNamed(SignUpView.routeName),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
