import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/utils/prices.dart';
import 'package:m_lista/src/ui/mobile/providers/product_provider.dart';
import 'package:m_lista/src/ui/mobile/styles/app_text_styles.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({required this.product, super.key});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Future<void> _deleteProduct(ProductProvider provider) async {
    final deleteProduct = provider.deleteProduct;
    final id = widget.product.id;

    if (id != null) {
      await deleteProduct(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.product.name}",
                  style: AppTextStyles.title,
                ),
                IconButton(
                  onPressed: () async {
                    await _deleteProduct(productProvider);
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: GlobalColors.primary.shade900,
                    size: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Quantidade: ${widget.product.quantity}",
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 10),
            Text(
              "Preço unitário: ${monetaryValueToString(widget.product.price ?? 0)}",
              style: AppTextStyles.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
