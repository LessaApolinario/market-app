import 'package:flutter/material.dart';
import 'package:m_lista/src/ui/mobile/styles/app_input_styles.dart';
import 'package:m_lista/src/ui/mobile/themes/global_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration:
                  AppInputStyles.getInputDecoration('Quantidade', 'Quantidade'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: AppInputStyles.getInputDecoration('Nome', 'Nome'),
              validator: (value) => _textInputValidator(value),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.text,
              decoration: AppInputStyles.getInputDecoration('Preço', 'Preço'),
              validator: (value) => _priceValidator(value),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: GlobalColors.primary.shade300,
              ),
              icon: Icon(
                Icons.add_box,
                size: 50,
                color: GlobalColors.primary.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
