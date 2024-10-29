import 'package:flutter/material.dart';

class InputThemeDev {
  InputDecorationTheme getTheme(Color colorOutline) {
    return InputDecorationTheme(
      suffixIconColor: colorOutline,
      hoverColor: colorOutline,
      focusColor: colorOutline,
      iconColor: colorOutline,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      border: const OutlineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
        borderRadius: BorderRadius.circular(0.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        borderRadius: BorderRadius.circular(0.0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(0.0),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: TextStyle(
        color: colorOutline,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decorationColor: Colors.blue[500],
      ),
    );
  }
}
