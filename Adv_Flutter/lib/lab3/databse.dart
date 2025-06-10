import 'package:madf/utils/import_export.dart';

class DatabaseCreation{
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), DBNAME);
    return openDatabase(
      path,
      version: DBVERSION,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $DBTABLENAME("
              "$DBID INTEGER PRIMARY KEY AUTOINCREMENT,"
              "$DBUSERNAME TEXT,"
              "$DBCITY TEXT,"
              "$DBGENDER TEXT"
              ")",
        );
      },
    );
  }

}