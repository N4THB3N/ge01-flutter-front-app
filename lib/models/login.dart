// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(
  Map<String, dynamic>.from(json.decode(str))
);

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    int id;
    String username;
    String email;
    String token;
    DateTime expiresAt;

    Login({
        required this.id,
        required this.username,
        required this.email,
        required this.token,
        required this.expiresAt,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        token: json["token"],
        expiresAt: DateTime.parse(json["expiresAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "token": token,
        "expiresAt": expiresAt.toIso8601String(),
    };
}
