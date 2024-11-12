import 'package:flutter/material.dart';
import 'package:flutter_architecture_v2/product/init/theme/custom_color_scheme.dart';
import 'package:flutter_architecture_v2/product/init/theme/custom_theme.dart';

/// Custom dark theme for project design
final class CustomDarkTheme implements CustomTheme{
  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.darkColorScheme,
    floatingActionButtonTheme: floatingActionButtonThemeData
  );
  
  @override
  // TODO: implement floatingActionButtonThemeData
  final FloatingActionButtonThemeData floatingActionButtonThemeData = const FloatingActionButtonThemeData();
}