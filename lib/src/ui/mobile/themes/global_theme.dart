import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';

class GlobalTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: GlobalColors.primary.shade900,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: GlobalColors.primary.shade50,
      ),
      iconTheme: IconThemeData(
        size: 30,
        color: GlobalColors.primary.shade50,
      ),
    ),
  );
}
