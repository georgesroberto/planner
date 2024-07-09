import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'planner.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT,
      password TEXT,
      email TEXT,
      phoneNumber TEXT
    )
  ''');
    await db.execute('''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      amount REAL,
      categoryId INTEGER,
      date TEXT,
      notes TEXT,
      recurring INTEGER,
      encryptionKey TEXT,
      FOREIGN KEY (userId) REFERENCES users(id),
      FOREIGN KEY (categoryId) REFERENCES categories(id)
    )
  ''');
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      parentId INTEGER,
      FOREIGN KEY (parentId) REFERENCES categories(id)
    )
  ''');
    await db.execute('''
    CREATE TABLE plans (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      name TEXT,
      goalAmount REAL,
      dueDate TEXT,
      notes TEXT,
      status TEXT,
      FOREIGN KEY (userId) REFERENCES users(id)
    )
  ''');
    await db.execute('''
    CREATE TABLE bills (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      name TEXT,
      amount REAL,
      dueDate TEXT,
      paid INTEGER,
      recurring INTEGER,
      partialPayment REAL,
      FOREIGN KEY (userId) REFERENCES users(id)
    )
  ''');
    await db.execute('''
    CREATE TABLE savingsGoals (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER,
      name TEXT,
      targetAmount REAL,
      progress REAL,
      FOREIGN KEY (userId) REFERENCES users(id)
    )
  ''');
  }

  Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> update(
      String table, Map<String, dynamic> data, String columnId, int id) async {
    final db = await database;
    return await db
        .update(table, data, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, String columnId, int id) async {
    final db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
