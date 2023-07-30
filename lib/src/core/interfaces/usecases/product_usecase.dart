import 'package:m_lista/src/core/domain/models/product.dart';

abstract class ProductUseCase {
  Future<bool> create(Product product);
  Future<List<Product>> fetch();
  Future<bool> delete(int id);
  Future<bool> deleteAll();
}
