import 'package:flutter/material.dart';
import 'package:planner/models/category.dart';
import 'package:planner/database/db_helper.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> loadCategories() async {
    final dbHelper = DBHelper();
    final dataList = await dbHelper.queryAllRows('categories');
    _categories = dataList.map((item) => Category.fromMap(item)).toList();
    notifyListeners();
  }

  Future<void> addCategory(Category category) async {
    final dbHelper = DBHelper();
    await dbHelper.insert('categories', category.toMap());
    _categories.add(category);
    notifyListeners();
  }

  Future<void> updateCategory(Category category) async {
    final dbHelper = DBHelper();
    await dbHelper.update('categories', category.toMap(), 'id', category.id!);
    final index = _categories.indexWhere((c) => c.id == category.id);
    _categories[index] = category;
    notifyListeners();
  }

  Future<void> deleteCategory(int id) async {
    final dbHelper = DBHelper();
    await dbHelper.delete('categories', 'id', id);
    _categories.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}
