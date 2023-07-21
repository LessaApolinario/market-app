import 'package:m_lista/src/core/domain/models/product.dart';

abstract class ProductUseCase {
  Future<bool> create(Product product);
}
