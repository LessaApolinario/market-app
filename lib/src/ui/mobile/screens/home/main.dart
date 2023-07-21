import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';
import 'package:m_lista/src/ui/mobile/widgets/base/AppBar/main.dart';
import 'package:m_lista/src/ui/mobile/widgets/home/AddProductForm/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.primary.shade200,
      appBar: const MainAppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: AddProductForm(),
        ),
      ),
    );
  }
}
