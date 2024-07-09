class Transaction {
  final int? id;
  final double amount;
  final String category;
  final DateTime date;
  final String notes;
  final int userId;

  Transaction({
    this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.notes,
    required this.userId,
  });

  // Convert a Transaction object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
      'notes': notes,
      'user_id': userId,
    };
  }

  // Convert a map into a Transaction object.
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      amount: map['amount'],
      category: map['category'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
      userId: map['user_id'],
    );
  }
}
