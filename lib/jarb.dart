import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  final _focusedDay = DateTime.now();
  final _selectedDay = DateTime.now();
  final _calendarFormat = CalendarFormat.month;

  DateTime? _selectedDate;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
  }

  void _onSendDatePressed() async {
    if (_selectedDate != null) {
      var url = Uri.parse('https://votre-serveur.com/ma-route');
      var response = await http
          .post(url, body: {'date': _selectedDate!.toIso8601String()});

      if (response.statusCode == 200) {
        print('La date a été transmise avec succès');
      } else {
        print('Une erreur est survenue lors de la transmission de la date');
      }
    } else {
      print('Veuillez sélectionner une date');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: _onDaySelected,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(fontSize: 18, fontFamily: 'font1'),
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              holidayTextStyle: TextStyle(color: Colors.black),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(fontFamily: 'font3'),
              weekendStyle: TextStyle(fontFamily: 'font3', color: Colors.black),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onSendDatePressed,
            child: Text('Envoyer la date'),
          ),
        ],
      ),
    );
  }
}
