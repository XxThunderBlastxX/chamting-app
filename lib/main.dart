import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/validator/validator_bloc.dart';
import 'constants/constants.dart';
import 'screens/home/home_view.dart';
import 'screens/register/register_view.dart';
import 'screens/signin/signin_view.dart';
import 'screens/signup/signup_view.dart';
import 'utils/auth.dart';
import 'utils/validator.dart';

late bool isAuthenticated;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  kToken = await getToken();
  isAuthenticated = validateJwtToken(kToken);
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1100, 730);
    const minSize = Size(366, 243);
    appWindow.minSize = minSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ValidatorBloc()),
      ],
      child: FluentApp(
        debugShowCheckedModeBanner: false,
        title: 'Chamting',
        theme: ThemeData(
          activeColor: Colors.teal,
          accentColor: Colors.teal,
        ),
        initialRoute:
            isAuthenticated ? RegisterView.routeName : HomeView.routeName,
        routes: {
          RegisterView.routeName: (context) => const RegisterView(),
          SignInView.routeName: (context) => const SignInView(),
          SignUpView.routeName: (context) => const SignUpView(),
          HomeView.routeName: (context) => const HomeView(),
        },
      ),
    );
  }
}
