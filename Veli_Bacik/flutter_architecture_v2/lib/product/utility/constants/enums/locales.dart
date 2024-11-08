import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish Locale
  tr(Locale('tr','TR')),
  /// English Locale
  en(Locale('en', 'US'));

  /// Locale value
  final Locale locale;
  const Locales(this.locale);
}