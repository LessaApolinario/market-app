import 'dart:async';

import 'package:sqflite/sqlite_api.dart';

abstract class BaseSqliteRepository {
  late Database _db;

  Future<Database> connect() async {
    _db = await initDB();
    return _db;
  }

  Future<void> close() async {
    await _db.close();
  }

  Future<FutureOr<void>> onCreate(Database db, int version);

  Future<Database> initDB();
}
