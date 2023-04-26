import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:sabri/classeR.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  final TextEditingController date = TextEditingController();
  final TextEditingController id = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> registre() async {
    final appointment = Appointment(
      doctorId: int.parse(id.text),
      appointmentDate: selectedDate.toUtc(),
    );

    final response = await http.post(
      Uri.parse(
          "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/patients/2/appointments"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjaGVkeTEyQGdtYWlsLmNvbSIsImV4cCI6MTY4MjUzMjUzMCwiaWF0IjoxNjgyNTE0NTMwfQ.NS7xLv9s0T3lSO5K83oy1Cm3eln1yQZnZ-DuvNJmAKx6eKfxYyVk0TpwSAU1nq8ECTv51vRImB1k5k3kyhtnLw"
      },
      body: {"doctorId": 1, "appointmentDate": "2023-04-26T11:00:00Z"},
    );

    if (response.statusCode == 200) {
      print('Appointment created successfully.');
    } else {
      print('Failed to create appointment. Error code: ${response.statusCode}');
    }

    print(appointment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: id, decoration: const InputDecoration()),
          TextField(controller: date, decoration: const InputDecoration()),
          ElevatedButton(
            onPressed: () {
              registre();
            },
            child: const Text('Create Appointment'),
          ),
        ],
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

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
        appointmentDate: DateTime.parse(json["appointmentDate"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "doctorId": doctorId,
        "appointmentDate": appointmentDate.toUtc().toIso8601String(),
      };
}
