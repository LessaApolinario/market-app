import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';
import 'package:m_lista/src/ui/mobile/widgets/base/AppBar/main.dart';
import 'package:m_lista/src/ui/mobile/widgets/home/AddProductForm/main.dart';
import 'package:m_lista/src/ui/mobile/widgets/home/ProductCard/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _products = <Product>[
    Product.fromJson({"quantity": 20, "name": "Tomate", "price": "26,90"}),
    Product.fromJson({"quantity": 2, "name": "Cenoura", "price": "8,0"}),
    Product.fromJson({"quantity": 4, "name": "Batata", "price": "9,0"}),
    Product.fromJson({"quantity": 20, "name": "Tomate", "price": "26,90"}),
    Product.fromJson({"quantity": 2, "name": "Cenoura", "price": "8,0"}),
    Product.fromJson({"quantity": 4, "name": "Batata", "price": "9,0"}),
    Product.fromJson({"quantity": 20, "name": "Tomate", "price": "26,90"}),
    Product.fromJson({"quantity": 2, "name": "Cenoura", "price": "8,0"}),
    Product.fromJson({"quantity": 4, "name": "Batata", "price": "9,0"}),
    Product.fromJson({"quantity": 20, "name": "Tomate", "price": "26,90"}),
    Product.fromJson({"quantity": 2, "name": "Cenoura", "price": "8,0"}),
    Product.fromJson({"quantity": 4, "name": "Batata", "price": "9,0"}),
    Product.fromJson({"quantity": 20, "name": "Tomate", "price": "26,90"}),
    Product.fromJson({"quantity": 2, "name": "Cenoura", "price": "8,0"}),
    Product.fromJson({"quantity": 4, "name": "Batata", "price": "9,0"})
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.primary.shade200,
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AddProductForm(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: _products.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(product: _products[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 5);
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Total: R\$ 99,50",
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
