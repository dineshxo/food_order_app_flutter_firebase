import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: ColorScheme.dark(
      surface: Color.fromARGB(255, 39, 39, 39),
      primary: const Color.fromARGB(255, 122, 122, 122),
      secondary: Color.fromARGB(255, 0, 0, 0),
      tertiary: Color.fromARGB(255, 29, 29, 29),
      inversePrimary: Colors.grey.shade300,
    ));
