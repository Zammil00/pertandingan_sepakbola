// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pertandingan_sepakbola/core/config/app_text_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.lightScheme.primary,
    scaffoldBackgroundColor: AppColors.lightScheme.background,
    textTheme: AppTextStyles.textTheme,
    colorScheme: AppColors.lightScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightScheme.background,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.text,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.darkScheme.primary,
    scaffoldBackgroundColor: AppColors.darkScheme.background,
    textTheme: AppTextStyles.textTheme,
    colorScheme: AppColors.darkScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textDark),
    ),
  );
}
