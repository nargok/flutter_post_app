import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDatasource {
  static final SqliteDatasource instance = SqliteDatasource._init();
  static Database? _database;

  SqliteDatasource._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('post.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        created_at TEXT      
      )
    ''');
  }

  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryRows(String tableName, int limit) async {
    final db = await instance.database;
    return await db.query(tableName, orderBy: 'created_at DESC', limit: limit);
  }

  Future<int> delete(String tableName, int id) async {
    final db = await instance.database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
