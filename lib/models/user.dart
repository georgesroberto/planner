class User {
  final int id;
  final String username;
  final String password;
  final String email;
  final String phoneNumber;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
