import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'TvSeries.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE product(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            type TEXT,
            LANGUAGE TEXT
          )
          ''');
      },
    );
  }

  Future<int> markTvSeries(Map<String, dynamic> TvSeries) async {
    final client = await db;
    return await client.insert('TvSeries', TvSeries);
  }

  Future<int> deleteProduct(int id) async {
    final client = await db;
    return await client.delete('TvSeries', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getMarkTvSeries() async {
    final client = await db;
    return await client.query('TvSeries');
  }

  Future<void> markShow(Map<String, String> map) async {}

  Future<void> deleteShow(int id) async {}

  Future getMarkShow() async {}
}
