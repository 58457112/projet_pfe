import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:table_calendar/table_calendar.dart';

class Chedy2 extends StatefulWidget {
  const Chedy2({Key? key}) : super(key: key);

  @override
  _Chedy2State createState() => _Chedy2State();
}

class _Chedy2State extends State<Chedy2> {
  DateTimeRange daterange =
      DateTimeRange(start: DateTime(2023, 4, 11), end: DateTime(2023, 4, 15));
  // late Map<DateTime, List<Event>> selectedEvent;
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  TextEditingController eventController = TextEditingController();

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

  Future<void> _showAvailability(
      BuildContext context, DateTime selectedDate) async {
    // Remplacez ce bloc par votre propre logique pour afficher les disponibilités
    List<String> availability = ['10:00', '11:00', '13:00', '14:00', '15:00'];
    final selectedTime = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Doctor Availability',
          style: TextStyle(fontFamily: 'font1'),
        ),
        content: Container(
          width: double.maxFinite,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: availability.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final time = availability[index];
              return InkWell(
                onTap: () {
                  // Fermer la boîte de dialogue et renvoyer le temps sélectionné
                  Navigator.pop(context, time);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    if (selectedTime != null) {
      // Envoyer la date et l'heure sélectionnées à l'API
      final selectedDate = _selectedDay.toIso8601String();

      // Convertir la date ISO8601 en DateTime
      final dateTime = DateTime.parse(selectedDate);

      // Extraire les composantes de la date
      final year = dateTime.year;
      final month = dateTime.month.toString().padLeft(2, '0');
      final day = dateTime.day.toString().padLeft(2, '0');

      // Formater la date dans le format souhaité
      final formattedDate = '$year-$month-$day';

      // Envoyer la date formatée à l'API
      final url = Uri.parse(
          'https://63f3d63afe3b595e2ee9fc78.mockapi.io/day/rendez-vous');
      final response = await http.post(url, body: {
        'selectedDate': formattedDate,
        'selectedTime': selectedTime,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Traitement de la réponse JSON
      final jsonResponse = json.decode(response.body);
      final dateRdv = jsonResponse['date_rdv'];
      final id = jsonResponse['id'];
      print('Date RDV: $dateRdv');
      print('ID: $id');
    }
  }

  final _categorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final start = daterange.start;
    final end = daterange.end;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text('date time range '),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      pickDateRange();
                    },
                    child: Text('1')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         NewRoute(selectedDateRange: daterange),
                      //   ),
                      // );
                    },
                    child: Text('2')),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _categorieController,
              decoration: InputDecoration(labelText: 'categorie'),
            )
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDteRange = await showDateRangePicker(
        context: context,
        initialDateRange: daterange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (newDteRange == null) return;
    setState(() => daterange = newDteRange);
  }

  DateTimeRange? selectedDateRange;

  void onDateRangeSelected(DateTimeRange dateRange) {
    setState(() {
      selectedDateRange = dateRange;
    });
  }
}
