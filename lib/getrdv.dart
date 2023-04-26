import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:table_calendar/table_calendar.dart';

import 'models/gettrdv.dart';
import 'package:intl/intl.dart';

class gettrdv extends StatefulWidget {
  const gettrdv({super.key});

  @override
  State<gettrdv> createState() => _gettrdvState();
}

class _gettrdvState extends State<gettrdv> {
  List<RendezVous> _rendezVousList = [];
  Future<List<RendezVous>> fetchRendezVous() async {
    final response = await http.get(Uri.parse(
        'https://63f3d63afe3b595e2ee9fc78.mockapi.io/day/rendez-vous'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .where((json) =>
              DateTime.tryParse(json["selectedDate"]) !=
              null) // Filter only JSON data with valid date format
          .map((json) => RendezVous.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load RendezVous');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRendezVous().then((rendezVousList) {
      setState(() {
        _rendezVousList = rendezVousList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for (var rendezVous in _rendezVousList)
            if (rendezVous.id == '60')
              Text(
                  '${DateFormat('dd/MM/yyyy').format(rendezVous.selectedDate)} ${rendezVous.selectedTime}'),
        ],
      ),
    );
  }
}
