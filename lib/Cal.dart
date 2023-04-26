import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sabri/chedy1.dart';

import 'package:sabri/rendezVous.dart';
import 'package:sabri/liste.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime? date;
  @override
  Future<void> pick() async {
    showDatePicker(
            context: context,
            firstDate: DateTime(2023, 0, 0),
            lastDate: DateTime(2024, 2, 1),
            initialDate: DateTime.now())
        .then((value) {
      setState(() {
        date = value as DateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(label: Text("rendez vous")),
              ),
              ElevatedButton(
                child: Text("open cal"),
                onPressed: () {
                  pick();
                },
              ),
              Text(date.toString()),
              ElevatedButton(
                  onPressed: () {
                    if (date != null) {
                      Rendez nouvrendez =
                          Rendez(date, 'Rendez vous avec le patient');
                      setState(() {
                        _list.add(nouvrendez);
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Calendrier();
                      }));
                    }
                  },
                  child: Text('ENREGISTRER'))
            ],
          ),
        ),
      ),
    );
  }
}

DateTime? date1;

//List<Rendez> _list = [
//Rendez(DateTime(date1!.year, date1!.month, date1!.day, date1!.hour), "sabri"),
//Rendez(DateTime(date1!.year, date1!.month, date1!.day, (date1!.hour) + 1),
//"chedy"),
//];
List<Rendez> _list = [
  Rendez(DateTime.now(), "sabri"),
  Rendez(DateTime.now().add(Duration(hours: 1)), "chedy"),
];

class Event1 {
  DateTime date;
  List<Rendez> rv;
  Event1({required this.date, required this.rv});
}

class Rendez {
  DateTime? time;
  String? toDo;
  Rendez(this.time, toDo);
}
