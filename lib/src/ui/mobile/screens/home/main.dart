import 'package:flutter/material.dart';
import 'package:m_lista/src/core/utils/prices.dart';
import 'package:m_lista/src/ui/mobile/providers/product_provider.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';
import 'package:m_lista/src/ui/mobile/widgets/base/AppBar/main.dart';
import 'package:m_lista/src/ui/mobile/widgets/home/AddProductForm/main.dart';
import 'package:m_lista/src/ui/mobile/widgets/home/ProductCard/main.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

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
              child: Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  final products = productProvider.products;

                  if (products.isEmpty) {
                    return Center(
                      child: Text(
                        "Nenhum produto disponível",
                        style: TextStyle(
                          color: GlobalColors.primary.shade900,
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                final total = productProvider.calculateTotalPrices();
                return Text(
                  "Total: R\$ ${monetaryValueToString(total)}",
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDeleteAllConfirmationDialog(context);
        },
        backgroundColor: GlobalColors.primary.shade900,
        child: Icon(
          Icons.delete,
          color: GlobalColors.primary.shade300,
        ),
      ),
    );
  }

  void _showDeleteAllConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Remover todos os produtos?",
            style: TextStyle(
              color: GlobalColors.primary.shade900,
              fontFamily: 'Quicksand',
              fontSize: 18,
            ),
          ),
          content: Text(
            "Esta ação não pode ser desfeita.",
            style: TextStyle(
              color: GlobalColors.primary.shade900,
              fontFamily: 'Quicksand',
              fontSize: 16,
            ),
          ),
          backgroundColor: GlobalColors.primary.shade300,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: GlobalColors.primary.shade300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: GlobalColors.primary.shade900,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: GlobalColors.primary.shade900,
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: GlobalColors.primary.shade900,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: GlobalColors.primary.shade300,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .clearProducts();
                Navigator.of(context).pop();
              },
              child: Text(
                "Confirmar",
                style: TextStyle(
                  color: GlobalColors.primary.shade300,
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
