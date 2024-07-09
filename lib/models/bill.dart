class Bill {
  final int? id;
  final String name;
  final double amount;
  final DateTime dueDate;
  final bool paid;
  final int userId;

  Bill({
    this.id,
    required this.name,
    required this.amount,
    required this.dueDate,
    required this.paid,
    required this.userId,
  });

  // Convert a Bill object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'due_date': dueDate.toIso8601String(),
      'paid': paid ? 1 : 0,
      'user_id': userId,
    };
  }

  // Convert a map into a Bill object.
  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'],
      name: map['name'],
      amount: map['amount'],
      dueDate: DateTime.parse(map['due_date']),
      paid: map['paid'] == 1,
      userId: map['user_id'],
    );
  }
}
