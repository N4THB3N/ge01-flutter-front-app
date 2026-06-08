import 'dart:convert';

List<User> UserFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    int id;
    String firstName;
    String lastName;
    String username;
    String email;
    String password;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.email,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_At"]),
        updatedAt: DateTime.parse(json["updated_At"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
        "username": username,
        "email": email,
        "password": password,
        "created_At": createdAt.toIso8601String(),
        "updated_At": updatedAt.toIso8601String(),
    };
}