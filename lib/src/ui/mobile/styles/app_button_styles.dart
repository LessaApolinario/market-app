import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';

class AppButtonStyles {
  static ButtonStyle primaryTextButton = TextButton.styleFrom(
    backgroundColor: GlobalColors.primary.shade300,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GlobalColors.primary.shade900,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
  );

  static ButtonStyle secondaryTextButton = TextButton.styleFrom(
    backgroundColor: GlobalColors.primary.shade900,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GlobalColors.primary.shade300,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
  );

  static ButtonStyle primaryElevatedButton = ElevatedButton.styleFrom(
    backgroundColor: GlobalColors.primary.shade900,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GlobalColors.primary.shade300,
        width: 2,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
    minimumSize: const Size.fromHeight(50),
  );
}
