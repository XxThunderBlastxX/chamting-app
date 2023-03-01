import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get theme => ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Color.fromARGB(255, 117, 116, 116),
        secondary: Colors.white,
        onSecondary: Color.fromARGB(255, 118, 119, 118),
        tertiary: Color.fromARGB(255, 193, 28, 28),
        error: Colors.red,
        onError: Colors.red,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.black,
        onSurface: Colors.black,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.prozaLibre(
          fontSize: 32.sp,
          letterSpacing: -0.02,
          height: 1.3,
          color: Colors.black,
        ),
        headlineMedium: GoogleFonts.prozaLibre(
          fontSize: 24.sp,
          letterSpacing: -0.02,
          height: 1.3,
          color: Colors.black,
        ),
        headlineSmall: GoogleFonts.prozaLibre(
          fontSize: 18.sp,
          letterSpacing: -0.02,
          height: 1.3,
          color: Colors.black,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 18.sp,
          height: 1.3,
          color: Colors.black,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 16.sp,
          height: 1.3,
          color: Colors.black,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 14.sp,
          height: 1.3,
          color: Colors.black,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          letterSpacing: 0.02,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.sp,
          letterSpacing: 0.02,
          color: Colors.black,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12.sp,
          letterSpacing: 0.02,
          color: Colors.black,
        ),
      ),
    );
