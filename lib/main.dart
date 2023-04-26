import 'package:flutter/material.dart';
import 'package:sabri/Cal.dart';
import 'package:sabri/chedy2.dart';
import 'package:sabri/chedy22.dart';
import 'package:sabri/chedy5.dart';
import 'package:sabri/dispo.dart';
import 'package:sabri/jdyd/availibility.dart';
import 'package:sabri/jdyd/getdocteurbyid.dart';
import 'package:sabri/jdyd/getmodel.dart';
import 'package:sabri/jdyd/postDocteur.dart';

import 'package:sabri/listerdv.dart';
import 'package:sabri/pop.dart';
import 'package:sabri/rendeeeee.dart';
import 'package:sabri/requette.dart';
import 'package:sabri/resetpassword.dart';
import 'package:sabri/testrdv.dart';

import 'besoin.dart';
import 'chedy1.dart';
import 'getrdv.dart';
import 'homeQare.dart';
import 'jarb.dart';
import 'jdyd/gedocteurs.dart';
import 'jdyd/getspatientbyId.dart';
import 'jdyd/getspec.dart';
import 'jdyd/post rendez-vous.dart';
import 'jdyd/post.dart';
import 'list2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: name(),
    );
  }
}
