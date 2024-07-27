import 'package:kivi_vpn/database/config_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _db;
  Future<Database> get dataBase async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initialize();
    return _db!;
  }

  Future<String> get fullPath async {
    const name = "v2ray.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
    return database;
  }

  Future<void> create(Database database, int version) async =>
      await ConfigDb().createTable(database);
}
