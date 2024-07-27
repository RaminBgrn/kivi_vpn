import 'package:kivi_vpn/database/database_helper.dart';
import 'package:kivi_vpn/features/feature_configs/model/config_model.dart';
import 'package:sqflite/sqflite.dart';

class ConfigDb {
  final tableName = 'configs';
  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName 
    ("id" INTEGER NOT NULL ,
     "title" TEXT NOT NULL ,
     "link" TEXT NOT NULL ,
     PRIMARY KEY ("id" AUTOINCREMENT))""");
  }

  Future<int> create({required String name, required String link}) async {
    final database = await DatabaseHelper().dataBase;
    return await database.rawInsert("""INSERT INTO
        $tableName(title , link)
        VALUES (? ,?)""", [name, link]);
  }

  Future<List<ConfigModel>> fetchAll() async {
    final database = await DatabaseHelper().dataBase;
    final configsQuery = await database.query("""SELECT * FROM $tableName""");
    return configsQuery
        .map((config) => ConfigModel.fromDatabase(config))
        .toList();
  }

  Future<ConfigModel> fetchById(int id) async {
    final database = await DatabaseHelper().dataBase;
    final configsQuery = await database
        .rawQuery("""SELECT * FROM $tableName WHERE id = ?""", [id]);
    return ConfigModel.fromDatabase(configsQuery.first);
  }

  Future<int> updateConfig(
      {required int id, String? title, String? link}) async {
    final database = await DatabaseHelper().dataBase;
    return await database.update(
      tableName,
      {
        if (title != null) 'title ': title,
        if (link != null) 'link': link,
      },
      where: "id = ?",
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseHelper().dataBase;
    await database.rawDelete("""DELETE FROM $tableName WHERE id = ?""", [id]);
  }
}
