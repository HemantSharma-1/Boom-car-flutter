// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
    bool success;
    UserClass user;

    User({
        required this.success,
        required this.user,
    });

    factory User.fromMap(Map<String, dynamic> json) => User(
        success: json["success"],
        user: UserClass.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "user": user.toMap(),
    };
}

class UserClass {
    String id;
    String name;
    String email;
    String phone;
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    UserClass({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}