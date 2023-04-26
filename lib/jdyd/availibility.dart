import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:sabri/classeR.dart';

class Feyza extends StatefulWidget {
  const Feyza({super.key});

  @override
  State<Feyza> createState() => _FeyzaState();
}

class _FeyzaState extends State<Feyza> {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

  Future<void> createAvailability() async {
    final availability = Availibility(
      startDate: DateTime.utc(2026, 08, 28, 9, 0, 0),
      endDate: DateTime.utc(2026, 09, 29, 18, 0, 0),
    );

    final response = await http.post(
      Uri.parse(
          "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/doctors/3/availabilities"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhbWluZTEyQGdtYWlsLmNvbSIsImV4cCI6MTY4MjUzNTE3MiwiaWF0IjoxNjgyNTE3MTcyfQ.17sGV3PGTDBgpwOJ04HFQhamkRvZiCK4c4DgqtPX0PRJLGCqgzSycBEFFloEareKUJc_pfZ66acJDIRdiKXGSg",
        "Content-Type": "application/json"
      },
      body: ' availibilityToJson(availability)',
    );
    if (response.statusCode == 204) {
      print('Availability created successfully.');
    } else {
      print(
          'Failed to create availability. Error code: ${response.statusCode}');
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                createAvailability();
              },
              child: const Text('Create Availability'))
        ],
      ),
    );
  }
}

// To parse this JSON data, do
//
//     final appointment = appointmentFromJson(jsonString);

// To parse this JSON data, do
//
//     final availibility = availibilityFromJson(jsonString);

// To parse this JSON data, do
//
//     final availibility = availibilityFromJson(jsonString);

String availibilityToJson(Availibility data) => json.encode(data.toJson());

class Availibility {
  Availibility({
    required this.startDate,
    required this.endDate,
  });

  DateTime startDate;
  DateTime endDate;

  factory Availibility.fromJson(Map<String, dynamic> json) => Availibility(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
