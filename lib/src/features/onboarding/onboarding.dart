import 'package:chamting_app/common/styled_button.dart';
import 'package:chamting_app/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes/route_names.dart';
import '../../utils/windows_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              const TitleBar(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 171.w,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(60, 10, 8, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Welcome ,\n",
                                style: theme.textTheme.headlineLarge,
                                children: [
                                  TextSpan(
                                    text: 'to Chamting App',
                                    style: theme.textTheme.headlineLarge,
                                  ),
                                ],
                              ),
                            ),
                            20.verticalSpace,
                            Text(
                              "Welcome to our Windows chamting application! Our app allows you to easily connect with friends, family, and new people from around the world. ",
                              style: theme.textTheme.labelLarge,
                            ),
                            20.verticalSpace,
                            Text(
                              "We hope you enjoy using our Windows chatting application! If you have any questions or need assistance, please contact our support team.",
                              style: theme.textTheme.labelLarge,
                            ),
                            40.verticalSpace,
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StyledButton(
                                    onTap: () => Navigator.pushNamed(
                                        context, AppRoute.login),
                                    text: 'Login',
                                  ),
                                  SizedBox(width: 15.w),
                                  StyledButton(
                                    onTap: () => Navigator.pushNamed(
                                        context, AppRoute.signUp),
                                    text: 'SignUp',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 171.w,
                      child: Image.asset(
                        'assets/images/onboarding.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
