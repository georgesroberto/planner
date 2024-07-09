import 'package:flutter/material.dart';
import 'package:planner/models/notification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotificationProvider with ChangeNotifier {
  late Database _database;
  List<AppNotification> _notifications = [];

  NotificationProvider() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await _openDatabase();
    // Fetch notifications on initialization
    await fetchNotifications();
  }

  Future<Database> _openDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'planner.db');

    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notifications (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        message TEXT NOT NULL,
        date TEXT NOT NULL,
        is_read INTEGER NOT NULL,
        user_id INTEGER NOT NULL
      )
    ''');
  }

  List<AppNotification> get notifications => _notifications;

  Future<void> fetchNotifications() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('notifications');

    _notifications = List.generate(maps.length, (i) {
      return AppNotification.fromMap(maps[i]);
    });

    notifyListeners();
  }

  Future<void> addNotification(AppNotification notification) async {
    await _database.insert(
      'notifications',
      notification.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await fetchNotifications(); // Refresh notifications list
  }

  Future<void> markAsRead(int id) async {
    await _database.update(
      'notifications',
      {'is_read': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    await fetchNotifications(); // Refresh notifications list
  }
}
