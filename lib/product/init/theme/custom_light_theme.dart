// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      );
}
