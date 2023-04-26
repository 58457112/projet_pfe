import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:table_calendar/table_calendar.dart';

class Bogh extends StatefulWidget {
  const Bogh({Key? key}) : super(key: key);

  @override
  _BoghState createState() => _BoghState();
}

class _BoghState extends State<Bogh> {
  // late Map<DateTime, List<Event>> selectedEvent;
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  TextEditingController eventController = TextEditingController();
  void sendDataToApi(DateTime selectedDay) async {
    var url = Uri.parse(
        'https://63f3d63afe3b595e2ee9fc78.mockapi.io/day/rendez-vous');
    var response =
        await http.post(url, body: {'selectedDay': selectedDay.toString()});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // traitement de la réponse JSON
    var jsonResponse = json.decode(response.body);
    var dateRdv = jsonResponse['date_rdv'];
    var id = jsonResponse['id'];
    print('Date RDV: $dateRdv');
    print('ID: $id');
  }

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: _onDaySelected,
                  headerStyle: HeaderStyle(
                    titleTextStyle:
                        TextStyle(fontSize: 18, fontFamily: 'font1'),
                    formatButtonVisible: false,
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    holidayTextStyle: TextStyle(color: Colors.black),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontFamily: 'font3'),
                    weekendStyle:
                        TextStyle(fontFamily: 'font3', color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (() {
                    sendDataToApi(_selectedDay);
                  }),
                  child: Text('ekhdem'))
            ],
          ),
        ],
      ),
    );
  }
}
