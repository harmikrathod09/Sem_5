import 'package:adv_flutter/utils/import_export.dart';

class DatabaseCreation{
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), DB_NAME);
    return openDatabase(
      path,
      version: DB_VERSION,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $DB_TABLE_NAME("
              "$DB_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$DB_USER_NAME TEXT,"
              "$DB_CITY TEXT,"
              "$DB_GENDER TEXT"
              ")",
        );
      },
    );
  }

}