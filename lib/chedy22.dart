import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:table_calendar/table_calendar.dart';

class Chedy22 extends StatefulWidget {
  const Chedy22({Key? key}) : super(key: key);

  @override
  _Chedy22State createState() => _Chedy22State();
}

class _Chedy22State extends State<Chedy22> {
  // DateTimeRange daterange =
  //     DateTimeRange(start: DateTime(2023, 4, 11), end: DateTime(2023, 4, 15));
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

  Future<void> _showAvailability(
      BuildContext context, DateTime selectedDate) async {
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
      final selectedDate = _selectedDay.toIso8601String();
      final dateTime = DateTime.parse(selectedDate);
      final year = dateTime.year;
      final month = dateTime.month.toString().padLeft(2, '0');
      final day = dateTime.day.toString().padLeft(2, '0');
      final formattedDate = '$year-$month-$day';
      final url = Uri.parse(
          'http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/patients/1/appointments');
      final response = await http.post(url, body: {
        'appointmentDate': '$formattedDate $selectedTime',
        'doctorId': 1
      });
      ;
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final jsonResponse = json.decode(response.body);
      final dateRdv = jsonResponse['date_rdv'];
      final id = jsonResponse['id'];
      print('Date RDV: $dateRdv');
      print('ID: $id');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final start = daterange.start;
    // final end = daterange.end;
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
              Container(
                padding: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 28, 46, 78),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((50)),
                      topRight: Radius.circular(50)),
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            top: 50,
                          ),
                          child: Text(
                            'Find Your Perfect Appointment Time',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'font1'),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 140),
                          child: SizedBox(
                            width: 200,
                            child: FloatingActionButton.extended(
                              backgroundColor:
                                  Color.fromARGB(255, 78, 173, 228),
                              onPressed: () {
                                _showAvailability(context, _selectedDay);
                              },
                              label: Text(
                                'Add an appointment',
                                style: TextStyle(
                                  fontFamily: 'font3',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Future pickDateRange() async {
  //   DateTimeRange? newDteRange = await showDateRangePicker(
  //       context: context,
  //       initialDateRange: daterange,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2100));
  //   if (newDteRange == null) return;
  //   setState(() => daterange = newDteRange);
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => NewRoute(selectedDateRange: daterange),
  //     ),
  //   );
  // }

//   DateTimeRange? selectedDateRange;

//   void onDateRangeSelected(DateTimeRange dateRange) {
//     setState(() {
//       selectedDateRange = dateRange;
//     });
//   }
// }

// class NewRoute extends StatelessWidget {
//   final DateTimeRange selectedDateRange;

//   const NewRoute({Key? key, required this.selectedDateRange}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final start = selectedDateRange.start;
//     final end = selectedDateRange.end;
//     final dateFormat = DateFormat('dd/MM/yyyy');
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Selected Date Range'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Selected date range:',
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '${dateFormat.format(start)} - ${dateFormat.format(end)}',
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(height: 20),
//               CalendarDatePicker(
//                 initialDate: start,
//                 firstDate: start,
//                 lastDate: end,
//                 selectableDayPredicate: (DateTime date) {
//                   return date.isAfter(start.subtract(Duration(days: 1))) &&
//                       date.isBefore(end.add(Duration(days: 1)));
//                 },
//                 onDateChanged: (DateTime? selectedDate) {
//                   // Do something when a new date is selected
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
}
