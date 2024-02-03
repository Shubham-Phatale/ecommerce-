import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "chatapp.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "name TEXT,"
          "email TEXT PRIMARY KEY,"
          "password TEXT"
          ")");
      await db.execute("CREATE TABLE Userproducts ("
          "email TEXT ,"
          "prod_name TEXT,"
          "prod_price DOUBLE,"
          "prod_color TEXT,"
          "prod_size TEXT,"
          "prod_Img TEXT"
          ")");
    });
  }

  newUser(String name, String email, String password) async {
    print(email);
    final db = await database;
    db.rawInsert(
      "INSERT Into User"
      " VALUES ('$name', '$email', '$password')");
  }

  getUser(String email) async {
    print(email);
    final db = await database;
    var res = await db.query("User", where: "email = ?", whereArgs: [email]);
    return res;
  }

  updateUser(String email, String password) async {
    final db = await database;
    db.update("User", {"password": password},
        where: "email = ?", whereArgs: [email]);
  }

  deleteUser(String email) async {
    final db = await database;
    db.delete("User", where: "email = ?", whereArgs: [email]);
  }

  saveproduct(String email,String name, double price,String color,String size, String image) async {
    final db = await database;
    db.rawInsert(
      "INSERT Into Userproducts"
      " VALUES ('$email','$name',$price,'$color','$size','$image')");
  }

  fetchproduct(String email) async {
    final db = await database;
    var prd = await db.query("Userproducts",where: "email = ?", whereArgs: [email]);
    print (prd);
    return prd;
  }

}