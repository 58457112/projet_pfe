// To parse this JSON data, do
//
//     final sabri = sabriFromJson(jsonString);

import 'dart:convert';

Sabri sabriFromJson(String str) => Sabri.fromJson(json.decode(str));

String sabriToJson(Sabri data) => json.encode(data.toJson());

class Sabri {
  Sabri({
    required this.id,
    required this.civility,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.appointments,
    required this.creationDate,
  });

  int id;
  String civility;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  List<dynamic> appointments;
  DateTime creationDate;

  factory Sabri.fromJson(Map<String, dynamic> json) => Sabri(
        id: json["id"],
        civility: json["civility"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        appointments: List<dynamic>.from(json["appointments"].map((x) => x)),
        creationDate: DateTime.parse(json["creationDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "civility": civility,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "appointments": List<dynamic>.from(appointments.map((x) => x)),
        "creationDate": creationDate.toIso8601String(),
      };
}
