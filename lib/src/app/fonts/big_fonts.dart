import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigFonts extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const BigFonts(
      {this.color = const Color.fromARGB(255, 0, 0, 0),
      super.key,
      this.size = 20,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.rubik(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
