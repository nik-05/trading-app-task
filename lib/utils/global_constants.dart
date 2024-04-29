import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalConstants {
  static const Color textPrimary = Color(0xFF212121);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF0063F5);
  static const Color scaffoldColor = Color(0xFFF8F9FA);
  static const Color dividerColor = Color(0xFFD9D9D9);
  static const Color positiveColor = Color(0xFF21BF73);
  static const Color negativeColor = Color(0xFFD90429);
  static const Color hintColor = Color(0xFF7F7F7F);

  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: GoogleFonts.adventPro(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: onPrimary,
      ),
    ),
  );
}
