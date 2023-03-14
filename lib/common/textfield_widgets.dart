import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hint;
  final bool obscure;
  final Widget? prefix;
  final Widget? suffix;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    this.prefix,
    this.suffix,
    required this.hint,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color.fromRGBO(158, 158, 158, 1),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        height: 45.h,
        width: 100.w,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 10),
          child: Center(
            child: TextField(
              obscureText: obscure,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                prefixIcon: prefix,
                border: InputBorder.none,
                suffixIcon: suffix,
              ),
              controller: controller,
              cursorHeight: 30.h,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(45),
      width: ScreenUtil().setWidth(43),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[400],
      ),
      child: Center(
        child: Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: const Color.fromARGB(234, 255, 255, 255),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(
              image,
              color: Colors.grey[600],
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonBig extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ButtonBig({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 40.w,
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(66, 66, 66, 1),
                blurRadius: 0.1,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.normal,
                offset: Offset(0, 1),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color.fromARGB(236, 255, 255, 255),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
