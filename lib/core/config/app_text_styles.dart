import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Define custom text styles
  static TextStyle displayLarge = GoogleFonts.outfit(
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayMedium = GoogleFonts.outfit(
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displaySmall = GoogleFonts.outfit(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineLarge = GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineMedium = GoogleFonts.outfit(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headlineSmall = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleLarge = GoogleFonts.outfit(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleMedium = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleSmall = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyLarge = GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyMedium = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodySmall = GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle labelLarge = GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelMedium = GoogleFonts.outfit(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelSmall = GoogleFonts.outfit(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  // Combine all text styles into a TextTheme
  static TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}
