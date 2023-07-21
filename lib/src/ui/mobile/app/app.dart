import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/routes/routes.dart';
import 'package:m_lista/src/ui/mobile/themes/global_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de compras",
      theme: GlobalTheme.theme,
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
