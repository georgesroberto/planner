import 'package:flutter/material.dart';
import 'package:planner/models/transaction.dart';
import 'package:planner/database/db_helper.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  Future<void> loadTransactions() async {
    final dbHelper = DBHelper();
    final dataList = await dbHelper.queryAllRows('transactions');
    _transactions = dataList.map((item) => Transaction.fromMap(item)).toList();
    notifyListeners();
  }

  Future<void> addTransaction(Transaction transaction) async {
    final dbHelper = DBHelper();
    await dbHelper.insert('transactions', transaction.toMap());
    _transactions.add(transaction);
    notifyListeners();
  }

  Future<void> updateTransaction(Transaction transaction) async {
    final dbHelper = DBHelper();
    await dbHelper.update(
        'transactions', transaction.toMap(), 'id', transaction.id!);
    final index = _transactions.indexWhere((t) => t.id == transaction.id);
    _transactions[index] = transaction;
    notifyListeners();
  }

  Future<void> deleteTransaction(int id) async {
    final dbHelper = DBHelper();
    await dbHelper.delete('transactions', 'id', id);
    _transactions.removeWhere((t) => t.id == id);
    notifyListeners();
  }
}
