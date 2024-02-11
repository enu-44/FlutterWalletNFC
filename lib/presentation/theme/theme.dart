// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pago_facil_app/presentation/theme/palette.dart';
import 'package:pago_facil_app/presentation/theme/text/text_theme.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Palette.primary,
    progressIndicatorTheme: progressIndicatorTheme(),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    elevatedButtonTheme: elevateButtonTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ProgressIndicatorThemeData progressIndicatorTheme() {
  return ProgressIndicatorThemeData(color: Palette.primary);
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Palette.inputBorder),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    hintStyle: TextStyle(color: Palette.bodyMedium),
    labelStyle: TextStyle(color: Colors.black),
  );
}

ElevatedButtonThemeData elevateButtonTheme() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all(Palette.primary), // Color de fondo del botón
    foregroundColor:
        MaterialStateProperty.all(Palette.white), // Color del texto del botón

    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Forma del botón redondeado
      ),
    ),
  ));
}

TextThemeCustom textTheme() {
  return TextThemeCustom(
    titleLarge: TextStyle(color: Palette.titleLarge),
    bodyLarge: TextStyle(color: Palette.bodyLarge),
    bodyMedium: TextStyle(color: Palette.bodyMedium),
    linkMedium:
        TextStyle(color: Palette.primary, decoration: TextDecoration.underline)
            .copyWith(decorationColor: Palette.primary),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      elevation: 0,
      backgroundColor: Palette.primary,
      systemOverlayStyle: SystemUiOverlayStyle.dark);
}
