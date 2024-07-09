class Bill {
  final int id;
  final int userId;
  final String name;
  final double amount;
  final DateTime dueDate;
  final bool paid;
  final bool recurring;
  final double partialPayment;

  Bill(
      {required this.id,
      required this.userId,
      required this.name,
      required this.amount,
      required this.dueDate,
      required this.paid,
      required this.recurring,
      required this.partialPayment});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'amount': amount,
      'dueDate': dueDate,
      'paid': paid,
      'recurring': recurring,
      'partialPayment': partialPayment,
    };
  }
}
