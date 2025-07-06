import 'dart:convert';

class User {
  final String id;
  final String name;
  final String document;

  User({required this.id, required this.name, required this.document});

  User.fromMap(Map<String, dynamic> map) : id = map['id'], name = map['name'], document = map['document'];

  static User? fromJson(String? json) {
    if (json == null) return null;

    return User.fromMap(jsonDecode(json));
  }

  String get json {
    return jsonEncode({'id': id, 'name': name, 'document': document});
  }
}
