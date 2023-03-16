import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/authentication/data/auth_repository.dart';
import 'features/authentication/presentation/login/login_screen.dart';
import 'features/authentication/presentation/signup/sign_up_screen.dart';
import 'features/home/presentation/home.dart';
import 'features/onboarding/onboarding.dart';
import 'routes/routes.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Chamting',
        theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        home: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            AsyncValue<Account?> authState = ref.watch(authStateProvider);
            //TODO: show any screen later on if new screens are added later
            return authState.maybeWhen(
              data: (Account? data) =>
                  data != null ? const HomeScreen() : const OnBoardingScreen(),
              orElse: () => const OnBoardingScreen(),
            );
          },
        ),
        routes: <String, WidgetBuilder>{
          AppRoute.onBoarding: (BuildContext context) =>
              const OnBoardingScreen(),
          AppRoute.home: (BuildContext context) => const HomeScreen(),
          AppRoute.signUp: (BuildContext context) => const SignUpScreen(),
          AppRoute.login: (BuildContext context) => const LoginScreen(),
        },
      ),
    );
  }
}
