class SavingsGoal {
  final int? id;
  final String name;
  final double targetAmount;
  final int userId;

  SavingsGoal({
    this.id,
    required this.name,
    required this.targetAmount,
    required this.userId,
  });

  // Convert a SavingsGoal object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'target_amount': targetAmount,
      'user_id': userId,
    };
  }

  // Convert a map into a SavingsGoal object.
  factory SavingsGoal.fromMap(Map<String, dynamic> map) {
    return SavingsGoal(
      id: map['id'],
      name: map['name'],
      targetAmount: map['target_amount'],
      userId: map['user_id'],
    );
  }
}
