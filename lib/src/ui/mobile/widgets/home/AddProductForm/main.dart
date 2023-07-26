import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/utils/prices.dart';
import 'package:m_lista/src/ui/mobile/providers/product_provider.dart';
import 'package:m_lista/src/ui/mobile/styles/app_input_styles.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<_AddProductFormState> _formKey = GlobalKey();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  _textInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  _priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório";
    }

    if (!value.toString().contains(",")) {
      return "Vírgulas obrigatórias";
    }

    return null;
  }

  Future<void> _createProduct(ProductProvider provider) async {
    final createProduct = provider.createProduct;

    await createProduct(Product.fromJson({
      "quantity": int.parse(_quantityController.text),
      "name": _nameController.text,
      "price": stringToMonetaryValue(_priceController.text)
    }));

    _clearFields();
  }

  _clearFields() {
    _quantityController.text = "";
    _nameController.text = "";
    _priceController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontFamily: 'Quicksand'),
            decoration:
                AppInputStyles.getInputDecoration('Quantidade', 'Quantidade'),
            validator: (value) => _textInputValidator(value),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontFamily: 'Quicksand'),
            decoration: AppInputStyles.getInputDecoration('Nome', 'Nome'),
            validator: (value) => _textInputValidator(value),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _priceController,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontFamily: 'Quicksand'),
            decoration: AppInputStyles.getInputDecoration('Preço', 'Preço'),
            validator: (value) => _priceValidator(value),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
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
            ),
            onPressed: () async {
              await _createProduct(productProvider);
            },
            child: Text(
              "Adicionar produto",
              style: TextStyle(
                color: GlobalColors.primary.shade300,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
