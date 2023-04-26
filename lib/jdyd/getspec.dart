import 'package:flutter/material.dart';
import 'package:sabri/jdyd/modelgetspec.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'getmodel.dart';

class Gettspec extends StatefulWidget {
  const Gettspec({Key? key});

  @override
  State<Gettspec> createState() => _GettspecState();
}

class _GettspecState extends State<Gettspec> {
  List<Spec>? specList;
  var isLoad = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var remoteService = RemoteService();
      var fetchedSpecList = await remoteService.getUsers();
      setState(() {
        specList = fetchedSpecList;
        isLoad = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: specList?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(specList?[index].name ?? ''),
        );
      },
    ));
  }
}

class RemoteService {
  // Future<String> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';
  //   return token;
  // }
  Future<List<Spec>> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse(
        "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/specialities");
    var response = await client.get(
      uri,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjaGVkeTEyQGdtYWlsLmNvbSIsImV4cCI6MTY4MjM0NDQ5MCwiaWF0IjoxNjgyMzI2NDkwfQ.hkUCV-B7cLnRTc3VgqacI179xqSvBvNPhlNS9v8eZrMb3EmqDiHRbq-6ssKVmtu1taTml0fwk8eJdiwHwD2lfw"
      },
    );
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json1 = utf8.decode(response.bodyBytes);

      var specList = Spec.specListFromJson(json.decode(json1));
      return specList;
    } else {
      throw Exception("Failed to get users");
    }
  }
}
