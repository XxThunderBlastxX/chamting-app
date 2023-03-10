import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:chamting_app/common/widgets/styled_button.dart';
import 'package:chamting_app/src/features/authentication/app/login_notifier.dart';
import 'package:chamting_app/src/routes/route_names.dart';
import 'package:chamting_app/src/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/widgets/widgets.dart';
import '../../../../utils/windows_button.dart';
import '../../domain/states/login_state.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginNotifierProvider, (previous, next) {
      if (next is LoginSuccess) {
        showSnackbar(
            message: 'Logged In SuccessFully', color: Colors.green.shade400);
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoute.home,
          (route) => false,
        );
      } else if (next is LoginError) {
        showSnackbar(message: next.failure.message, color: Colors.red.shade400);
      } else {
        // do nothing as of now but can be used to show loading dialog
      }
    });
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                      child: MoveWindow(
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 3, 3),
                          child: Text(
                            "Chamting-App",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    const WindowButtons(),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(171),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 33.h),
                          CustomTextField(
                            controller: emailController,
                            maxLines: 1,
                            hint: "Email",
                            suffix: const Icon(Icons.email_rounded),
                            obscure: false,
                          ),
                          SizedBox(height: 12.h),
                          CustomTextField(
                            controller: passwordController,
                            maxLines: 1,
                            hint: "Password",
                            suffix: const Icon(Icons.lock_rounded),
                            obscure: true,
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 80.h,
                            width: 95.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                StyledButton(
                                  text: 'Log in',
                                  onTap: () async {
                                    await ref
                                        .read(loginNotifierProvider.notifier)
                                        .loginUser(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 53.h),
                          SizedBox(
                            height: 60.h,
                            width: 124.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Got an account? Register with',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const CircularButton(
                                  image: 'assets/images/google_icon.png',
                                ),
                                const CircularButton(
                                    image: 'assets/images/google_icon.png'),
                                const CircularButton(
                                    image: 'assets/images/google_icon.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(171),
                      child: Image.asset(
                        'assets/images/LOGIN.png',
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
