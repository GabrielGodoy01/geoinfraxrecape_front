import 'package:clean_flutter_template/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
    primaryColor: AppColors.primary,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(AppColors.primary),
    thumbColor: MaterialStateProperty.all<Color>(AppColors.white),
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(color: AppColors.white),
    displayMedium: AppTextStyles.displayMedium.copyWith(color: AppColors.white),
    displaySmall: AppTextStyles.displaySmall.copyWith(color: AppColors.white),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: AppColors.white),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
    titleMedium: AppTextStyles.titleMedium.copyWith(color: AppColors.white),
    titleSmall: AppTextStyles.titleSmall.copyWith(color: AppColors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
