import 'package:adv_flutter/utils/import_export.dart';

class MyDatabase {
  String path = "${getDatabasesPath()}/$DB_STUDENT";

  Future<Database> initDatabase() async => await openDatabase(
    path,
    version: STUDENT_DB_VERSION,
    onCreate: (db, version) async {
      await db.execute(
        "CREATE TABLE $TBL_STUDENT("
        "$COL_STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$COL_STUDENT_FNAME TEXT,"
        "$COL_STUDENT_LNAME TEXT,"
        "$COL_STUDENT_ENO TEXT,"
        "$COL_STUDENT_EMAIL TEXT,"
        "$COL_STUDENT_PHONE TEXT,"
        "$COL_STUDENT_BRANCH TEXT,"
        "$COL_STUDENT_CGPA DECIMAL,"
        "$COL_STUDENT_DIPL_CGPA DECIMAL"
        ")",
      );
    },
  );
}
