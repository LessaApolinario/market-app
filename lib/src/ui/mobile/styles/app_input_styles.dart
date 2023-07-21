import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';

class AppInputStyles {
  static InputDecoration getInputDecoration(
      String? hintText, String? labelText) {
    return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: GlobalColors.primary.shade900,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      labelStyle: TextStyle(
          color: GlobalColors.primary.shade900,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'Quicksand'),
      focusColor: GlobalColors.primary.shade900,
      fillColor: GlobalColors.primary.shade900,
      hintText: hintText,
      labelText: labelText,
    );
  }
}
