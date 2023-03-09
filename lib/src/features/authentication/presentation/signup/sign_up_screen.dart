import 'package:chamting_app/common/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/fonts/fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 179, 194),
      body: SizedBox(
        height: 720.h,
        width: 1480.r,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: Colors.white),
            height: 300.h,
            width: 300.w,
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
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
                                color: const Color.fromRGBO(92, 84, 107, 1.0),
                                fontSize: 22.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'CHAMTING',
                            style: GoogleFonts.pacifico(
                                color: const Color.fromRGBO(92, 84, 107, 1.0),
                                fontSize: 28.sp,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 5.h),
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 179, 179, 194),
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 5.h),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 179, 179, 194),
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          StyledButton(onTap: () {}, text: "Sign Up"),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextButton(
                              onPressed: () {
                                // navigate to login page
                              },
                              child: const small_fonts(
                                  text: 'Already a Member ? Sign In Here'))
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
                                  color: const Color.fromARGB(40, 51, 50, 71),
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
    );
  }
}
