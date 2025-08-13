import 'package:sqflite/sqflite.dart';// Database related functions ke liye
import 'package:path/path.dart';// join() function ke liye


// DbHelper naam ka ek class jo database ka kaam handle karega
class DbHelper {
  // static variable jo Database ka instance store karega
  static Database? database;

  // static method: Database ka instance banane ke liye
  static Future<void> getDataBase() async {
    // Agar database abhi null hai, to naya create karo
    if (database == null) {
      // Device me database ka path get karna
      var dbPath = await getDatabasesPath();

      // Database ka path + file name join karke final location banana
      var addDataBaseName = join(dbPath, "edugaonPatna.db");

      // Database open/create karna
      database = await openDatabase(
        addDataBaseName, // file ka path
        version: 1, // version number (migrations ke liye)
        onCreate: (db, version) {
          // Jab database pehli baar create ho, tab ye chalega
          // Table create karna: students
          db.execute(
              "CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, email TEXT, profile_pic TEXT)"
          );
        },
      );
    }
  }

  // static method: Students table me data insert karne ke liye
  static Future<int?> insertStudents(Map<String, dynamic> data) async {
    // Pehle database instance lena/banwana
    await getDataBase();
    // Data insert karna aur inserted row ka id return karna
    return await database?.insert("students", data);
  }

  // static method: Students table ka saara data fetch karne ke liye
  static Future<List<Map<String, Object?>>?> selectStudents() async {
    // Pehle database instance lena/banwana
    await getDataBase();
    // Table me se saare rows select karke list return karna
    return await database?.query("students");
  }
}
