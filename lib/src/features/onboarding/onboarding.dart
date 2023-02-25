import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(171),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 8, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome ,",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 50.sp,
                          ),
                        ),
                        Text(
                          "to the Chamting App",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Welcome to our Windows chamting application! Our app allows you to easily connect with friends, family, and new people from around the world. ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "We hope you enjoy using our Windows chatting application! If you have any questions or need assistance, please contact our support team.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ButtonsBig(title: "Login"),
                              SizedBox(width: 15.w),
                              const ButtonsBig(title: "SignUp"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(171),
                  child: Image.asset(
                    'assets/images/onboarding.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
