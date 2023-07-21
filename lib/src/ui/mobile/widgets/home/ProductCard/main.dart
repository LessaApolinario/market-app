import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
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
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          Text("Quantidade: ${widget.product.quantity}"),
          const SizedBox(width: 5),
          Text("Nome: ${widget.product.name}"),
          const SizedBox(width: 5),
          Text("Preço: ${widget.product.price}"),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: GlobalColors.primary.shade300,
            ),
            icon: Icon(
              Icons.delete_rounded,
              size: 30,
              color: GlobalColors.primary.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
