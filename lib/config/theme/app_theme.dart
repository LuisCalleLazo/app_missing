
import 'package:app_missing/config/theme/input_theme_dev.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final Color _colorOutline = const Color.fromRGBO(45, 100, 220, 1);

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.amber[200],
          selectionHandleColor: Colors.amber[200],
        ),
        iconTheme: IconThemeData(
          color: _colorOutline,
          size: 25,
        ),
        inputDecorationTheme: InputThemeDev().getTheme(_colorOutline),
      );
}
