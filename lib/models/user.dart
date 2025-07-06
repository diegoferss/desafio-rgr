import 'dart:convert';

class User {
  final String id;
  final String? name;
  final String email;

  User({required this.id, required this.name, required this.email});

  User.fromMap(Map<String, dynamic> map) : id = map['id'], name = map['name'], email = map['email'];

  static User? fromJson(String? json) {
    if (json == null) return null;

    return User.fromMap(jsonDecode(json));
  }

  String get json {
    return jsonEncode({'id': id, 'name': name, 'email': email});
  }
}
