// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

List<Client> clientFromJson(String str) => List<Client>.from(json.decode(str).map((x) => Client.fromJson(x)));

String clientToJson(List<Client> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Client {
    int id;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String addr1;
    String municipality;
    String department;
    String occupation;
    DateTime dob;
    DateTime createdAt;
    DateTime updatedAt;

    Client({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
        required this.addr1,
        required this.municipality,
        required this.department,
        required this.occupation,
        required this.dob,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        firstName: json["first_Name"],
        lastName: json["last_Name"],
        email: json["email"],
        phoneNumber: json["phone_Number"],
        addr1: json["addr1"],
        municipality: json["municipality"],
        department: json["department"],
        occupation: json["occupation"],
        dob: DateTime.parse(json["dob"]),
        createdAt: DateTime.parse(json["created_At"]),
        updatedAt: DateTime.parse(json["updated_At"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_Name": firstName,
        "last_Name": lastName,
        "email": email,
        "phone_Number": phoneNumber,
        "addr1": addr1,
        "municipality": municipality,
        "department": department,
        "occupation": occupation,
        "dob": dob.toIso8601String(),
        "created_At": createdAt.toIso8601String(),
        "updated_At": updatedAt.toIso8601String(),
    };
}
