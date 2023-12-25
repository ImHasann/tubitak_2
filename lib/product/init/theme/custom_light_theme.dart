// ignore_for_file: always_use_package_imports, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

import 'custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ColorConstants.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorConstants.white,
            backgroundColor: ColorConstants.primaryColor, // Buton rengi
          ),
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: ColorConstants.blackPrimary),
          titleMedium: TextStyle(color: ColorConstants.greyPrimary),
          headlineMedium: TextStyle(color: Colors.blue),
          bodySmall: TextStyle(color: ColorConstants.greyPrimary),
          bodyMedium: TextStyle(color: ColorConstants.greyPrimary),
          displaySmall: TextStyle(color: ColorConstants.blackPrimary),
          
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: ColorConstants.greyPrimary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
