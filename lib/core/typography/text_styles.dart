import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/theme/palette.dart';
import 'package:pago_facil_app/core/typography/font_weights.dart';
import 'package:pago_facil_app/core/typography/fonts.dart';

/// App Text Style Definitions
/// Source: https://m3.material.io/styles/typography/type-scale-tokens
class TextStyles {
  const TextStyles._();

  static const _baseTextStyle = TextStyle(
      fontFamily: FontFamily.muli,
      fontWeight: AppFontWeight.medium,
      letterSpacing: -.5,
      color: Palette.black);

  static TextStyle headlineSmall = _baseTextStyle.copyWith(fontSize: 20);

  static TextStyle headlineLarge = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
  );

  static TextStyle headlineMedium = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle displayLarge = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    color: Palette.primary,
  );

  static TextStyle bodySmall = _baseTextStyle.copyWith(fontSize: 14);

  static TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
    color: Palette.greyDark,
  );

  static TextStyle bodyLarge =
      _baseTextStyle.copyWith(fontSize: 16, color: Palette.greyDark);

  static TextStyle titleLarge = _baseTextStyle.copyWith(
      fontSize: 22,
      letterSpacing: -.4,
      fontWeight: AppFontWeight.semiBold,
      color: Palette.black);

  static TextStyle titleMedium = _baseTextStyle.copyWith(
      fontSize: 14, fontWeight: AppFontWeight.semiBold, color: Palette.black);

  static TextStyle labelSmall = _baseTextStyle.copyWith(fontSize: 12);

  static TextStyle labelMedium = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.regular,
    color: Palette.black.withOpacity(.8),
  );

  static TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: 14,
    color: Palette.black.withOpacity(.6),
  );
}
