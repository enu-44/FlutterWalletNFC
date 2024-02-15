import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/theme/palette.dart';
import 'package:pago_facil_app/core/theme/text/text_theme.dart';
import 'package:pago_facil_app/core/typography/fonts.dart';

/// [FlutPagoFacilTheme] is a theme that can be used to style the UI of the app.
class FlutPagoFacilTheme {
  const FlutPagoFacilTheme._();

  static const FlexSchemeData _flutCinematicFlexShemeData = FlexSchemeData(
    name: 'Pago Facil Theme',
    description: 'Pago Facil theme, custom definition of all colors',
    light: FlexSchemeColor(
      primary: Palette.primary,
      secondary: Palette.secondary,
    ),
    dark: FlexSchemeColor(
      primary: Palette.primary,
      secondary: Palette.secondary,
    ),
  );

  /// [light] is the default theme for  PagoFacil
  static final light = FlexThemeData.light(
    colors: _flutCinematicFlexShemeData.light,
    fontFamily: FontFamily.muli,
  ).copyWith(
      progressIndicatorTheme: _progressIndicatorTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: _appBarTheme,
      textTheme: textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      elevatedButtonTheme: _elevateButtonTheme,
      textButtonTheme: _textButtonTheme,
      dropdownMenuTheme: _dropdownMenuTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      floatingActionButtonTheme: _floatingButtonTheme,
      tabBarTheme: _tabBarTheme);

  static TabBarTheme get _tabBarTheme => TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Palette.primary,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Palette.primary,
        ),
      );

  static OutlineInputBorder get _formFieldOutlineBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Palette.grey),
        gapPadding: 10,
      );

  static DropdownMenuThemeData get _dropdownMenuTheme => DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: _formFieldOutlineBorder,
        focusedBorder: _formFieldOutlineBorder,
        border: _formFieldOutlineBorder,
        hintStyle: const TextStyle(color: Palette.greyDark),
        labelStyle: const TextStyle(color: Colors.black),
      ));

  static ProgressIndicatorThemeData get _progressIndicatorTheme =>
      const ProgressIndicatorThemeData(color: Palette.primary);

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: _formFieldOutlineBorder,
        focusedBorder: _formFieldOutlineBorder,
        border: _formFieldOutlineBorder,
        hintStyle: const TextStyle(color: Palette.greyDark),
        labelStyle: const TextStyle(color: Colors.black),
      );

  static ElevatedButtonThemeData get _elevateButtonTheme =>
      ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) =>
            states.contains(MaterialState.disabled)
                ? Palette.disabled
                : Palette.primary), // Color de fondo del botón
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) =>
            states.contains(MaterialState.disabled)
                ? Palette.greyDark
                : Palette.white), // Color del texto del botón
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Forma del botón redondeado
          ),
        ),
      ));

  static TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: Palette.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ));

  static TextThemeCustom get textTheme => TextThemeCustom(
        linkMedium: const TextStyle(
                color: Palette.primary, decoration: TextDecoration.underline)
            .copyWith(decorationColor: Palette.primary),
      );
  static AppBarTheme get _appBarTheme => const AppBarTheme(
        backgroundColor: Palette.primary,
        foregroundColor: Palette.white,
        elevation: 0.0,
      );

  static FloatingActionButtonThemeData get _floatingButtonTheme =>
      const FloatingActionButtonThemeData(
          foregroundColor: Palette.white, backgroundColor: Palette.primary);
}
