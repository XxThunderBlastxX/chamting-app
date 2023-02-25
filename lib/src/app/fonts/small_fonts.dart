import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class small_fonts extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const small_fonts(
      {this.color = const Color.fromARGB(255, 0, 0, 0),
      super.key,
      this.size = 12,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: GoogleFonts.pacifico(
          color: color,
          fontSize: size,
        ),
      ),
    );
  }
}
