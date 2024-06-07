import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  // Membuat Database Baru
  static Future<sql.Database> db() async {
  return sql.openDatabase(
    'anand.db',
    version: 1,
    onCreate: (sql.Database database, int version) async {
       await createTables(database);
      },
    );
  } 

  //Create New Items(Journal)
  static Future<int> createItem(String title, String? description) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': description};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // //Read a single item by id
  // static Future<List<Map<String, dynamic>>> getItems(int id) async {

  // }

  // //Update an item by id
  // static Future<int> updateItem()

}
