class Plan {
  final int id;
  final int userId;
  final String name;
  final double goalAmount;
  final DateTime dueDate;
  final String notes;
  final String status;

  Plan({
    required this.id,
    required this.userId,
    required this.name,
    required this.goalAmount,
    required this.dueDate,
    required this.notes,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId ': userId,
      'name ': name,
      'goalAmount ': goalAmount,
      'dueDate ': dueDate,
      'notes ': notes,
      'status ': status,
    };
  }
}
