import 'package:m_lista/src/core/interfaces/usecases/product_usecase.dart';
import 'package:m_lista/src/core/services/product_service.dart';
import 'package:m_lista/src/infra/sqlite/product/product_sqlite_repository.dart';

class DIContainer {
  static ProductUseCase getProductUseCase() {
    return ProductService(ProductSqliteRepository());
  }
}
