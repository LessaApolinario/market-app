import 'package:flutter/material.dart';
import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/interfaces/usecases/product_usecase.dart';

class ProductProvider with ChangeNotifier {
  late ProductUseCase _useCase;
  List<Product> _products = [];

  ProductProvider(ProductUseCase useCase) {
    _useCase = useCase;
  }

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _useCase.fetch();

    notifyListeners();
  }

  Future<void> createProduct(Product product) async {
    final productCreated = await _useCase.create(product);

    if (productCreated) {
      await fetchProducts();
      notifyListeners();
    }
  }
}
