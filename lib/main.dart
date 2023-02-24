import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chamting_app/ui/pages/login/login.dart';
import 'package:chamting_app/ui/pages/onboarding/onboarding.dart';
import 'package:chamting_app/ui/pages/sign_UP/sign_up.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    const minSize = Size(780, 680);
    appWindow.minSize = minSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => FluentApp(
        debugShowCheckedModeBanner: false,
        title: 'Chamting',
        theme: ThemeData(
          activeColor: Colors.teal,
          accentColor: Colors.teal,
        ),
        initialRoute: '/onboarding',
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          OnboardingPage.routeName: (context) => const OnboardingPage(),
        },
      ),
    );
  }
}
