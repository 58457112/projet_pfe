import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'getmodel.dart';

class Gett extends StatefulWidget {
  const Gett({super.key});

  @override
  State<Gett> createState() => _GettState();
}

class _GettState extends State<Gett> {
  Sabri? users;
  var isLoad = false;
  String? email;
  String name = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var remoteService = RemoteService();
      var fetchedUsers = await remoteService.getUsers();
      setState(() {
        users = fetchedUsers;
        email = users!.phoneNumber;
        isLoad = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(email.toString())),
    );
  }
}

class RemoteService {
  // Future<String> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';
  //   return token;
  // }

  Future<Sabri?> getUsers() async {
    var client = http.Client();
    // var token = await getToken();
    // var token =
    //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjaGVkeTExMTFAZ21haWwuY29tIiwiZXhwIjoxNjc4ODQ2MTUwLCJpYXQiOjE2Nzg4MjgxNTB9.alTWnzou5E3GCDU60K52vlqHu6DgNJ1L9T6O3KVVS9d3oSyF5FBkjX5dieVZcZ27t927FjCV8L8cpTSg_C_r4Q";
    var uri = Uri.parse(
        "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/patients/2");
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
      var user = Sabri?.fromJson(json.decode(json1));
      return user;
    } else {
      throw Exception("Failed to get users");
    }
  }
}
