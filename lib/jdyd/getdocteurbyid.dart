import 'package:flutter/material.dart';
import 'package:sabri/jdyd/getdocteur.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'getmodel.dart';

class GetDoc extends StatefulWidget {
  const GetDoc({super.key});

  @override
  State<GetDoc> createState() => _GetDocState();
}

class _GetDocState extends State<GetDoc> {
  Docteurr? users;
  var isLoad = false;
  String? email;
  List<Availability> availabilities = [];
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
        users = fetchedUsers as Docteurr?;
        availabilities = users!.availabilities;
        email = users!.address;

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
        itemCount: availabilities.length,
        itemBuilder: (BuildContext context, int index) {
          Availability availability = availabilities[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text(email.toString())),
                Text('Disponibilité ${index + 1}:'),
                SizedBox(height: 8),
                Text('Début: ${availability.startDate}'),
                Text('Fin: ${availability.endDate}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RemoteService {
  // Future<String> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';
  //   return token;
  // }

  Future<Docteurr?> getUsers() async {
    var client = http.Client();
    // var token = await getToken();
    // var token =
    //     "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjaGVkeTExMTFAZ21haWwuY29tIiwiZXhwIjoxNjc4ODQ2MTUwLCJpYXQiOjE2Nzg4MjgxNTB9.alTWnzou5E3GCDU60K52vlqHu6DgNJ1L9T6O3KVVS9d3oSyF5FBkjX5dieVZcZ27t927FjCV8L8cpTSg_C_r4Q";
    var uri = Uri.parse(
        "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/doctors/1");
    var response = await client.get(
      uri,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmRvZUBtYWlsLmNvbSIsImV4cCI6MTY4MjQ0NDgxNCwiaWF0IjoxNjgyNDI2ODE0fQ.2bjLOmFEKV7ve_5J71-TEOdHwH3iP6LiNQ87NjCiaVTvWNEoiTjLR4BENG53yh4D3VDmroyYHmcjYaOGBurYzg"
      },
    );
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json1 = response.body;
      var user = Docteurr?.fromJson(json.decode(json1));
      return user;
    } else {
      throw Exception("Failed to get users");
    }
  }
}
