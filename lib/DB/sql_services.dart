import 'dart:async';
import 'package:izam_task/Models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLServices {
  final String databaseName = "izam.db";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await createTables(db);
    });
  }

  static Future<void> createTables(Database database) async {
    await database.execute("CREATE TABLE IF NOT EXISTS User ("
        "id integer primary key AUTOINCREMENT,"
        "email TEXT,"
        "password TEXT,"
        "logins integer"
        ")");
  }

  Future<int> login(UserModel user)  async {
    var currentUser = await getUserWithEmail(user.email ?? "", user.password ?? "");

    if (currentUser == null) {
      await addUserToDatabase(user);
       return 1;
    } else {
      currentUser.numberOfLogins = (currentUser.numberOfLogins ?? 1) + 1;
       await updateUser(currentUser);
      return currentUser.numberOfLogins ?? 1;
    }
  }

  addUserToDatabase(UserModel user) async {
    final db = await initDB();
    var raw = await db.insert(
      "User",
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return raw;
  }

  updateUser(UserModel user) async {
    final db = await initDB();
    var response = await db
        .update("User", user.toMap(), where: "id = ?", whereArgs: [user.id]);
    return response;
  }

  Future<UserModel?> getUserWithId(int id) async {
    final db = await initDB();
    var response = await db.query("User", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? UserModel.fromMap(response.first) : null;
  }

  Future<UserModel?> getUserWithEmail(String email, String password) async {
    final db = await initDB();
    var response = await db.query("User",
        where: "email = ? and password = ?", whereArgs: [email, password]);
    return response.isNotEmpty ? UserModel.fromMap(response.first) : null;
  }
}
