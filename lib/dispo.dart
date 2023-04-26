import 'package:flutter/material.dart';

import 'chedy2.dart';

class Dispo extends StatefulWidget {
  const Dispo({super.key});

  @override
  State<Dispo> createState() => _DispoState();
}

class _DispoState extends State<Dispo> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _startDate)
      setState(() {
        _startDate = picked;
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disponibilité du médecin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Date de début de travail:'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectStartDate(context),
              child: Text('Sélectionner la date de début'),
            ),
            SizedBox(height: 20),
            Text('Date de fin de travail:'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectEndDate(context),
              child: Text('Sélectionner la date de fin'),
            ),
            Text(_startDate.toString()),
            Text(_endDate.toString()),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Chedy2(
                  //       startDate: _startDate,
                  //       endDate: _endDate,
                  //     ),
                  //   ),
                  // );
                },
                child: Text('ekhdem aad'))
          ],
        ),
      ),
    );
  }
}
