import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import '../models/student.dart';

Database db;
int version = 1;
Future createDb() async {
  Directory decumentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(decumentsDirectory.path, "MyDatabase.db");
  db = await openDatabase(path, version: version, onCreate: _onCreate);
}

Future _onCreate(Database db, int version) async {
  await db.execute(
      'CREATE TABLE Student(id INTERGER PRIMARY KEY, name TEXT NOT NULL, age INTERGER NOT NULL, image CLOB)');
}

Future<int> insert(Map<String, dynamic> row) async {
  return await db.insert("Student", row);
}

Future<List<Map<String, dynamic>>> select() async {
  return await db.query("Student");
}

Future<List<Student>> getStudentList() async {
  List<Map<String, dynamic>> studentMap = await select();
  return studentMap.map((e) => Student.fromMap(e)).toList();
}

Future<int> update(Map<String, dynamic> newRow, int id) async {
  return await db.update("Student", newRow, where: 'id = ?', whereArgs: [id]);
}

Future<int> delete(int id) async {
  return await db.delete("Student", where: 'id = ?', whereArgs: [id]);
}
