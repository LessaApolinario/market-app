import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/dicontainer/dicontainer.dart';
import 'package:m_lista/src/ui/mobile/providers/product_provider.dart';
import 'package:m_lista/src/ui/mobile/routes/routes.dart';
import 'package:m_lista/src/ui/mobile/themes/global_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(DIContainer.getProductUseCase()),
      child: MaterialApp(
        title: "Lista de compras",
        theme: GlobalTheme.theme,
        initialRoute: '/',
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
