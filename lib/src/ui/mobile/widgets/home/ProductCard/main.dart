import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/utils/prices.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: GlobalColors.primary.shade300,
      elevation: 3,
      shadowColor: GlobalColors.primary.shade900,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: GlobalColors.primary.shade900,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detalhes do produto:",
              style: TextStyle(
                color: GlobalColors.primary.shade900,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Quantidade: ${widget.product.quantity}"),
            Text("Nome: ${widget.product.name}"),
            Text("Preço: ${monetaryValueToString(widget.product.price ?? 0)}"),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.primary.shade900,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: GlobalColors.primary.shade300,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text(
                "Excluir produto",
                style: TextStyle(
                  color: GlobalColors.primary.shade300,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
