import 'dart:convert';

class AuthModel {
  final String accessToken;
  final User user;

  AuthModel({
    required this.accessToken,
    required this.user,
  });

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String roles;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"] ?? '-',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
      };
}
