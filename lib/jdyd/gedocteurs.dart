import 'package:flutter/material.dart';
import 'package:sabri/jdyd/getdocteur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'getmodel.dart';
import 'modelgetdocteurs.dart';

class Soltani extends StatefulWidget {
  const Soltani({super.key});

  @override
  State<Soltani> createState() => _SoltaniState();
}

class _SoltaniState extends State<Soltani> {
  Docteur1? users;
  List<Item>? items1;
  Item? ss;
  var isLoad = false;
  int size = 1;
  bool? email;
  var remoteService = RemoteService();
  void _incrementSize() {
    setState(() {
      size++;
    });
    getData();
  }

  void _deincrementSize() {
    setState(() {
      size--;
    });
    getData();
  }

  String name = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var remoteService = RemoteService();
      remoteService.pageSize++;
      var fetchedUsers = await remoteService.getUsers(size);
      setState(() {
        users = fetchedUsers;
        items1 = fetchedUsers?.items;
        ss = items1![0];
        name = ss!.lastName;

        email = users!.first;
        isLoad = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(name.toString())),
          ElevatedButton(
              onPressed: (() {
                _incrementSize();

                getData();
              }),
              child: Text('chedy')),
          ElevatedButton(
              onPressed: (() {
                if (size > 1) {
                  _deincrementSize();
                  getData();
                }
              }),
              child: Text('soltani'))
        ],
      ),
    );
  }
}

class RemoteService {
  int pageSize = 0;
  void incrementPageSize() {
    pageSize++;
  }

  Future<Docteur1?> getUsers(int size) async {
    var client = http.Client();

    var uri = Uri.parse(
        "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/doctors?page=1&size=$size");

    var response = await client.get(
      uri,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmRvZUBtYWlsLmNvbSIsImV4cCI6MTY4MjM4MzgzNSwiaWF0IjoxNjgyMzY1ODM1fQ.e_hLCjT7pBTqTivO5EKMbdhjfdy8oSqn1lnx_DWijVW3SjweJQAcc764ZAwHHiUL5v_XKSnFqblTHEKGEAnmUA"
      },
    );
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json1 = response.body;
      var user = Docteur1?.fromJson(json.decode(json1));
      return user;
    } else {
      throw Exception("Failed to get users");
    }
  }
}
