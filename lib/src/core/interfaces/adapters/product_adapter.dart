import 'package:m_lista/src/core/domain/models/product.dart';

abstract class ProductAdapter {
  Future<bool> create(Product product);
  Future<List<Product>> fetch();
}
