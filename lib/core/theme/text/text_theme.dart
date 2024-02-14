import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/typography/text_styles.dart';

class TextThemeCustom extends TextTheme {
  final TextStyle linkMedium;
  TextThemeCustom({
    required this.linkMedium,
  }) : super(
          displayLarge: TextStyles.displayLarge,
          headlineSmall: TextStyles.headlineSmall,
          headlineMedium: TextStyles.headlineMedium,
          headlineLarge: TextStyles.headlineLarge,
          bodySmall: TextStyles.bodySmall,
          bodyMedium: TextStyles.bodyMedium,
          bodyLarge: TextStyles.bodyLarge,
          titleSmall: TextStyles.titleSmall,
          titleLarge: TextStyles.titleLarge,
          titleMedium: TextStyles.titleMedium,
          labelSmall: TextStyles.labelSmall,
          labelMedium: TextStyles.labelMedium,
        );
}
