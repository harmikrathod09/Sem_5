import 'package:madf/lab3/databse.dart';
import 'package:madf/utils/import_export.dart';

class ModelClassDatabaseCRUD {
  DatabaseCreation _databaseCreation=DatabaseCreation();

  Future<int> addUserDatabase(Map<String, dynamic> user) async {
    final db = await _databaseCreation.initDatabase();
    return await db.insert(DBTABLENAME, user);
  }

  Future<List<Map<String, Object?>>> readUserDatabase() async {
    final db = await _databaseCreation.initDatabase();
    return await db.query(DBTABLENAME);
  }

  Future<int> removeUserDatabase(id) async {
    final db = await _databaseCreation.initDatabase();
    return await db.delete(DBTABLENAME, where: "$DBID=?", whereArgs: [id]);
  }

  Future<int>   updateUserDatebase(user, id) async {
    final db = await _databaseCreation.initDatabase();
    return await db.update(
      DBTABLENAME,
      user,
      where: "$DBID=?",
      whereArgs: [id],
    );
  }
}
