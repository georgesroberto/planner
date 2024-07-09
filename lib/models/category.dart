class Category {
  final int id;
  final String name;
  final int? parentId;

  Category({required this.id, required this.name, this.parentId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }
}
