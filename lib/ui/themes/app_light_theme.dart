import 'package:flutter/material.dart';

ThemeData makeAppThemeLight() {
  ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      textStyle: const TextStyle(color: Colors.white, fontSize: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
  );

  return ThemeData(elevatedButtonTheme: _elevatedButtonTheme);
}
