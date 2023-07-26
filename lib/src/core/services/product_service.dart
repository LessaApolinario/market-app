import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/interfaces/adapters/product_adapter.dart';
import 'package:m_lista/src/core/interfaces/usecases/product_usecase.dart';

class ProductService extends ProductUseCase {
  late ProductAdapter _adapter;

  ProductService(ProductAdapter adapter) {
    _adapter = adapter;
  }

  @override
  Future<bool> create(Product product) {
    return _adapter.create(product);
  }

  @override
  Future<List<Product>> fetch() {
    return _adapter.fetch();
  }
}
