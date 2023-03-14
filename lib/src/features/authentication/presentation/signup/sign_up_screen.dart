import 'package:chamting_app/common/styled_button.dart';
import 'package:chamting_app/src/features/authentication/app/signup_notifier.dart';
import 'package:chamting_app/src/features/authentication/domain/states/sign_up_state.dart';
import 'package:chamting_app/src/routes/route_names.dart';
import 'package:chamting_app/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app/fonts/fonts.dart';
import '../../../../utils/windows_button.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signupNotifierProvider, (previous, next) async {
      if (next is SignUpSuccess) {
        showSnackbar(
            message: next.successMessage, color: Colors.green.shade400);
        await Navigator.of(context).pushNamed(AppRoute.login);
      } else if (next is SignUpError) {
        showSnackbar(message: next.failure.message, color: Colors.red.shade400);
      }
    });
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 179, 194),
      body: SizedBox(
        height: 720.h,
        width: 1480.r,
        child: Column(
          children: [
            const TitleBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white),
                height: 430.h,
                width: 300.w,
                alignment: Alignment.centerRight,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: Column(
                              children: [
                                Text(
                                  'WELCOME TO',
                                  style: GoogleFonts.pacifico(
                                      color: const Color.fromRGBO(
                                          92, 84, 107, 1.0),
                                      fontSize: 22.sp,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'CHAMTING',
                                  style: GoogleFonts.pacifico(
                                      color: const Color.fromRGBO(
                                          92, 84, 107, 1.0),
                                      fontSize: 28.sp,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 50.h),
                                RPadding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: TextFormField(
                                    validator: (value) => value.validateEmail(),
                                    controller: emailController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(
                                          255, 179, 179, 194),
                                      filled: true,
                                      hintText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                                RPadding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value) =>
                                        value.validatePassword(),
                                    controller: passwordController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(
                                          255, 179, 179, 194),
                                      filled: true,
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                StyledButton(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      await ref
                                          .read(signupNotifierProvider.notifier)
                                          .signUpUser(
                                              email:
                                                  emailController.text.trim(),
                                              password: passwordController.text
                                                  .trim());
                                    }
                                  },
                                  text: "Sign Up",
                                ),
                                SizedBox(height: 10.h),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushReplacementNamed(
                                    context,
                                    AppRoute.login,
                                  ),
                                  child: const small_fonts(
                                      text: 'Already a Member ? Sign In Here'),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 8.h),
                                child: Container(
                                  height: 260.h,
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/talking.png',
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 8),
                                        blurRadius: 1.w,
                                        color: const Color.fromARGB(
                                            40, 51, 50, 71),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
