import 'package:flutter/material.dart';

class InputThemeDev {
  InputDecorationTheme getTheme(Color colorOutline) {
    return InputDecorationTheme(
      suffixIconColor: colorOutline,
      hoverColor: colorOutline,
      focusColor: colorOutline,
      iconColor: colorOutline,
      fillColor: Colors.amber[100],
      border: const OutlineInputBorder(),
      labelStyle: TextStyle(
        backgroundColor: Colors.white,
        color: colorOutline,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        decorationColor: Colors.amber,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorOutline,
          width: 3,
        ),
      ),
    );
  }
}
