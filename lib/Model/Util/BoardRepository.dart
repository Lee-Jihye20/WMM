import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './DBHelper.dart';
import './Board.dart';

class BoardRepository {
  Future<Database> get _db async => DBHelper.instance.database;

  Future<int> insert(String title) async {
    final db = await _db;
    return db.insert('boards', {
      'title': title,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Board>> getAll() async {
    final db = await _db;
    final maps = await db.query('boards', orderBy: 'id DESC');
    return maps.map((m) => Board.fromMap(m)).toList();
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return db.delete('boards', where: 'id = ?', whereArgs: [id]);
  }
}
