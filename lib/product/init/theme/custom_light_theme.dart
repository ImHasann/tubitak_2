// ignore_for_file: always_use_package_imports, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

import 'custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: ColorConstants.primaryColor),
          titleMedium: TextStyle(color: ColorConstants.greyPrimary),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
