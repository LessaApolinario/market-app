import 'dart:async';

import 'package:m_lista/src/core/domain/models/product.dart';
import 'package:m_lista/src/core/interfaces/adapters/product_adapter.dart';
import 'package:m_lista/src/infra/sqlite/base_sqlite_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ProductSqliteRepository extends BaseSqliteRepository
    implements ProductAdapter {
  @override
  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'marketList.db');

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  @override
  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE product(ID INTEGER PRIMARY KEY AUTOINCREMENT, quantity INTEGER, name TEXT, price REAL);";
    await db.execute(sql);
  }

  @override
  Future<bool> create(Product product) async {
    Database database = await connect();
    String sql = "INSERT INTO product (quantity, name, price) VALUES (?, ?, ?)";
    final productCreatedId = await database.rawInsert(sql, [
      product.quantity,
      product.name,
      product.price,
    ]);

    if (productCreatedId > 0) {
      return true;
    }

    return false;
  }

  @override
  Future<List<Product>> fetch() async {
    List<Product> products = [];
    Database database = await connect();
    var productsAsMap = await database.query('product');

    for (var productAsMap in productsAsMap) {
      products.add(Product.fromJson(productAsMap));
    }

    return products;
  }
}
