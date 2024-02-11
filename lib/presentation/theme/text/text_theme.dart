import 'package:flutter/material.dart';

class TextThemeCustom extends TextTheme {
  final TextStyle linkMedium;
  const TextThemeCustom({
    required TextStyle bodyLarge,
    required TextStyle bodyMedium,
    required TextStyle titleLarge,
    required this.linkMedium,
  }) : super(
            bodyLarge: bodyLarge,
            bodyMedium: bodyMedium,
            titleLarge: titleLarge);
}
