import 'package:madf/utils/import_export.dart';

class ModelClassDatabaseCRUD {
  Future<Database> initDatabase() async {
    String _path = join(await getDatabasesPath(), DBNAME);
    return openDatabase(
      _path,
      version: DBVERSION,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $DBTABLENAME("
          "$DBID INTERGER PRIMARY KEY AUTOINCREMENT,"
          "$DBUSERNAME TEXT,"
          "$DBCITY TEXT,"
          "$DBGENDER TEXT"
          ")",
        );
      },
    );
  }

  Future<int> addUserDatabase(Map<String, dynamic> user) async {
    final db = await initDatabase();
    return await db.insert(DBTABLENAME, user);
  }

  Future<List<Map<String, Object?>>> readUserDatabase() async {
    final db = await initDatabase();
    return await db.query(DBTABLENAME);
  }

  Future<int> removeUserDatabase(id) async {
    final db = await initDatabase();
    return await db.delete(DBTABLENAME, where: "$DBID=?", whereArgs: [id]);
  }

  Future<int> updateUserDatebase(user, id) async {
    final db = await initDatabase();
    return await db.update(
      DBTABLENAME,
      user,
      where: "$DBID=?",
      whereArgs: [id],
    );
  }
}
