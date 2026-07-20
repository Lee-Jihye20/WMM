import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._();
  DBHelper._();
  static Database? _db;

  Future<Database> get database async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON'); // ← これを追加
      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE boards(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            createdAt TEXT
          )
          ''');
        await db.execute('''
          CREATE TABLE cards(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            boardId INTEGER NOT NULL,
            title TEXT NOT NULL,
            contents TEXT,
            x INTEGER NOT NULL,
            y INTEGER NOT NULL,
            createdAt TEXT,
            FOREIGN KEY (boardId) REFERENCES boards(id) ON DELETE CASCADE
          )
        ''');
        final now = DateTime.now().toIso8601String();

        // boards
        final board1 = await db.insert('boards', {
          'title': '仕事',
          'createdAt': now,
        });
        final board2 = await db.insert('boards', {
          'title': 'プライベート',
          'createdAt': now,
        });

        // cards（insertの戻り値 = 自動採番されたid を boardId に使う）
        await db.insert('cards', {
          'boardId': board1,
          'title': '資料作成',
          'contents': '資料作成の内容',
          'x': 0,
          'y': 0,
          'createdAt': now,
        });
        await db.insert('cards', {
          'boardId': board1,
          'title': 'メール返信',
          'contents': 'メール返信の内容',
          'x': 20,
          'y': 0,
          'createdAt': now,
        });
        await db.insert('cards', {
          'boardId': board2,
          'title': '買い物',
          'contents': '買い物の内容',
          'x': 30,
          'y': 0,
          'createdAt': now,
        });
      },
    );
  }
}
