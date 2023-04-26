import 'package:flutter/cupertino.dart';

class Event {
  //final DateTime date;
  final String title;

  Event(@required this.title);
  String toString() => this.title;
}
