import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/init/theme/custom_color_scheme.dart';
import 'package:flutter_architecture_v2/product/init/theme/custom_theme.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme{
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightColorScheme,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 15)
    ),
    fontFamily: GoogleFonts.aDLaMDisplay().fontFamily,
    floatingActionButtonTheme: floatingActionButtonThemeData
  );
  
  @override
  // TODO: implement floatingActionButtonThemeData
  final FloatingActionButtonThemeData floatingActionButtonThemeData = const FloatingActionButtonThemeData();
}