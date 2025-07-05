import 'package:adv_flutter/utils/import_export.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._();
  static Database? _db;
  MyDatabase._();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB(DB_STUDENT);
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final path = join(await getDatabasesPath(), filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $TBL_STUDENT (
      $COL_STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $COL_STUDENT_FNAME TEXT,
      $COL_STUDENT_LNAME TEXT,
      $COL_STUDENT_ENO TEXT,
      $COL_STUDENT_EMAIL TEXT,
      $COL_STUDENT_PHONE TEXT,
      $COL_STUDENT_BRANCH TEXT,
      $COL_STUDENT_CGPA REAL,
      $COL_STUDENT_DIPL_CGPA REAL
    )
    ''');
  }
}