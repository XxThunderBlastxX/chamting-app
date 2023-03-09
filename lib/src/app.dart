import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/authentication/presentation/login/login_screen.dart';
import 'features/authentication/presentation/signup/sign_up_screen.dart';
import 'features/home/presentation/home.dart';
import 'features/onboarding/onboarding.dart';
import 'routes/routes.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Chamting',
        theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        initialRoute: AppRoute.onBoarding,
        routes: {
          AppRoute.onBoarding: (context) => const OnBoardingScreen(),
          AppRoute.home: (context) => const HomeScreen(),
          AppRoute.signUp: (context) => const SignUpScreen(),
          AppRoute.login: (context) => const LoginScreen(),
        },
      ),
    );
  }
}
