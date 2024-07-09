class SavingsGoal {
  final int id;
  final int userId;
  final String name;
  final double targetAmount;
  final double progress;

  SavingsGoal({
    required this.id,
    required this.userId,
    required this.name,
    required this.targetAmount,
    required this.progress,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'targetAmount': targetAmount,
      'progress': progress,
    };
  }
}
