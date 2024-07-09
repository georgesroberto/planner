class AppNotification {
  final int? id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;
  final int userId;

  AppNotification({
    this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    required this.userId,
  });

  // Convert a Notification object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'date': date.toIso8601String(),
      'is_read': isRead ? 1 : 0,
      'user_id': userId,
    };
  }

  // Convert a map into a Notification object.
  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      id: map['id'],
      title: map['title'],
      message: map['message'],
      date: DateTime.parse(map['date']),
      isRead: map['is_read'] == 1,
      userId: map['user_id'],
    );
  }
}
