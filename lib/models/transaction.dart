class Transaction {
  final int id;
  final int userId;
  final double amount;
  final int categoryId;
  final DateTime date;
  final String notes;
  final bool recurring;
  final String encryptionKey;

  Transaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.categoryId,
    required this.date,
    required this.notes,
    required this.recurring,
    required this.encryptionKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'categoryId': categoryId,
      'date': date.toIso8601String(),
      'notes': notes,
      'recurring': recurring ? 1 : 0,
      'encryptionKey': encryptionKey,
    };
  }
}
