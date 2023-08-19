import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/styles/app_text_styles.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart),
          const SizedBox(width: 10),
          Text(
            'Lista de compras',
            style: AppTextStyles.secondaryMediumText,
          ),
        ],
      ),
    );
  }
}
