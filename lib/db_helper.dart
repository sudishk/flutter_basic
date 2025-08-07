import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  getDatabase()async{
    var databasePath =await getDatabasesPath();
    var addDataBasePathWithName = join(databasePath + "edugaon.db");

   return openDatabase(addDataBasePathWithName, version: 1, onCreate: (db, version) {
      db.execute("CREATE TABLE users(id INTEGER, name TEXT, gender TEXT)");
      return db;
    },);
  }
}