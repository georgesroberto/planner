class Category {
  final int? id;
  final String name;

  Category({this.id, required this.name});

  // Convert a Category object into a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Convert a map into a Category object.
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }
}
