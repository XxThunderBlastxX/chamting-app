import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    this.prefix,
    this.suffix,
    required this.hint,
    required this.obscure,
  });
  final TextEditingController controller;
  final int maxLines;
  final String hint;
  final bool obscure;
  Widget? prefix;
  Widget? suffix;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.5,
            color: const Color.fromRGBO(158, 158, 158, 1),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        height: 50,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 10),
          child: Center(
            child: TextField(
              obscureText: obscure,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                prefixIcon: prefix,
                border: InputBorder.none,
                suffixIcon: suffix,
              ),
              controller: controller,
              cursorHeight: 30,
              style: const TextStyle(
                fontSize: 18,
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
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
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
          height: 26,
          width: 26,
          decoration: BoxDecoration(
            color: Color.fromARGB(234, 255, 255, 255),
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
