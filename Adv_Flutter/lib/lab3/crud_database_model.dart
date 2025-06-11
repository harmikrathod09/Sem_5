import 'package:adv_flutter/lab3/databse.dart';
import 'package:adv_flutter/utils/import_export.dart';

class ModelClassDatabaseCRUD {
  DatabaseCreation _databaseCreation=DatabaseCreation();

  Future<int> addUserDatabase(Map<String, dynamic> user) async {
    final db = await _databaseCreation.initDatabase();
    return await db.insert(DB_TABLE_NAME, user);
  }

  Future<List<Map<String, Object?>>> readUserDatabase() async {
    final db = await _databaseCreation.initDatabase();
    return await db.query(DB_TABLE_NAME);
  }

  Future<int> removeUserDatabase(id) async {
    final db = await _databaseCreation.initDatabase();
    return await db.delete(DB_TABLE_NAME, where: "$DB_ID=?", whereArgs: [id]);
  }

  Future<int>   updateUserDatebase(user, id) async {
    final db = await _databaseCreation.initDatabase();
    return await db.update(
      DB_TABLE_NAME,
      user,
      where: "$DB_ID=?",
      whereArgs: [id],
    );
  }
}
