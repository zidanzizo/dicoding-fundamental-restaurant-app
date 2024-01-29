import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFFF23F5E);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.15),
  titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
