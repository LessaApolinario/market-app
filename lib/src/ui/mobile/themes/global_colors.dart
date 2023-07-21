import 'package:flutter/material.dart';

class GlobalColors {
  static const MaterialColor primary = MaterialColor(_primaryColor, {
    50: Color(0xFFF7F3FA),
    100: Color(0xFFEFE6F4),
    200: Color(0xFFD7C0E3),
    300: Color(0xFFBD98D0),
    400: Color(0xFF8D4FAF),
    500: Color(_primaryColor),
    600: Color(0xFF52037D),
    700: Color(0xFF380254),
    800: Color(0xFF2A023F),
    900: Color(0xFF1B0129),
  });
  static const int _primaryColor = 0xFF5C038C;
}
