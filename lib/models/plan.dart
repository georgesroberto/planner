class Plan {
  final int? id;
  final String name;
  final double goalAmount;
  final DateTime dueDate;
  final String notes;
  final int userId;

  Plan({
    this.id,
    required this.name,
    required this.goalAmount,
    required this.dueDate,
    required this.notes,
    required this.userId,
  });

  // Convert a Plan object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'goal_amount': goalAmount,
      'due_date': dueDate.toIso8601String(),
      'notes': notes,
      'user_id': userId,
    };
  }

  // Convert a map into a Plan object.
  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['id'],
      name: map['name'],
      goalAmount: map['goal_amount'],
      dueDate: DateTime.parse(map['due_date']),
      notes: map['notes'],
      userId: map['user_id'],
    );
  }
}
