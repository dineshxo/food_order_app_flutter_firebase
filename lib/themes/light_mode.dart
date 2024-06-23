import 'package:flutter/material.dart';
import 'package:food_order/constants/style.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: Colors.grey.shade500,
      secondary: mainYellow,
      tertiary: const Color.fromARGB(255, 237, 237, 237),
      inversePrimary: Colors.grey.shade700,
    ));
