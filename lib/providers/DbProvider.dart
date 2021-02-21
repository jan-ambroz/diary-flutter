import 'dart:async';
import 'dart:io';

import 'package:flutter_app/model/day.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Test.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Day ("
          "id INTEGER PRIMARY KEY,"
          "date TIMESTAMP,"
          "data TEXT,"
          "blocked BIT"
          ")");
    });
  }

  newDay(Day newDay) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Day");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Day (id,date,data)"
        " VALUES (?,?,?)",
        [id, newDay.data, newDay.timestamp]);
    return raw;
  }

  updateDay(Day newDay) async {
    final db = await database;
    var res = await db
        .update("Day", newDay.toMap(), where: "id = ?", whereArgs: [newDay.id]);
    return res;
  }

  getDay(int id) async {
    final db = await database;
    var res = await db.query("Day", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Day.fromMap(res.first) : null;
  }

  Future<List<Day>> getBlockedDays() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Day WHERE blocked=1");
    var res = await db.query("Day", where: "blocked = ? ", whereArgs: [1]);

    List<Day> list =
        res.isNotEmpty ? res.map((c) => Day.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Day>> getAllDays() async {
    final db = await database;
    var res = await db.query("Day");
    List<Day> list =
        res.isNotEmpty ? res.map((c) => Day.fromMap(c)).toList() : [];
    return list;
  }

  deleteDay(int id) async {
    final db = await database;
    return db.delete("Day", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Day");
  }
}
