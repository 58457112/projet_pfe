// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));

String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
    required this.doctorId,
    required this.appointmentDate,
  });

  int doctorId;
  DateTime appointmentDate;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        doctorId: json["doctorId"],
        appointmentDate: DateTime.parse(json["appointmentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
        "appointmentDate": appointmentDate.toIso8601String(),
      };
}
