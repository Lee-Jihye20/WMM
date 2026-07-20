import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './DBHelper.dart';
import './Card.dart';

class CardRepository {
  Future<Database> get _db async => DBHelper.instance.database;

  Future<int> insert(
    int boardId,
    String title,
    String contents,
    int x,
    int y,
  ) async {
    final db = await _db;
    return db.insert('cards', {
      'boardId': boardId,
      'title': title,
      'contents': contents,
      'x': x,
      'y': y,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  Future<List<CardModel>> getByBoard(int boardId) async {
    final db = await _db;
    final maps = await db.query(
      'cards',
      where: 'boardId = ?',
      whereArgs: [boardId],
    );
    print('開いているboardId: ${boardId}');
    return maps.map((m) => CardModel.fromMap(m)).toList();
  }

  Future<List<CardModel>> getAll() async {
    final db = await DBHelper.instance.database;
    final maps = await db.query('cards');
    return maps.map((m) => CardModel.fromMap(m)).toList();
  }
}
