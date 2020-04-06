import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],
    accentColor: Colors.grey[300]
  );

  factory AppTheme() => null;

  static ThemeData getTheme(){
    return _theme;
  }
}