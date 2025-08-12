import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DbHelper {
 static Database? database;

static Future<void> getDataBase()async{
    if(database==null){
      var dbPath =await getDatabasesPath();
      var addDataBaseName = join(dbPath , "edugaonPatna.db");
      database = await openDatabase(addDataBaseName, version: 1, onCreate: (db, version) {
         db.execute("CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT, profile_pic TEXT)");
      },);
    }
  }


 static Future<int?> insertStudents(Map<String, dynamic> data)async{
   await getDataBase();
   return await database?.insert("students",  data);
  }
  
  static Future<List<Map<String, Object?>>?> selectStudents()async{
    await getDataBase();
   return await database?.query("students");
  }

  
}