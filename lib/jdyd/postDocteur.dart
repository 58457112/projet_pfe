import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model post.dart';
import 'modelgetspec.dart';
import 'modelpostDoc.dart';

class Chedy2222 extends StatefulWidget {
  const Chedy2222({Key? key});

  @override
  State<Chedy2222> createState() => _Chedy2222State();
}

class _Chedy2222State extends State<Chedy2222> {
  Spec? selectedSpec;

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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController civilController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController spectController = TextEditingController();
  final List<int> specIds = [1, 2, 3, 4];
  Future<void> registre() async {
    var _users = Docteur(
      email: emailController.text,
      password: passwordController.text,
      firstName: firstnameController.text,
      lastName: lastController.text,
      civility: civilController.text,
      phoneNumber: phoneController.text,
      address: adressController.text,
      specialityId: int.parse(spectController.text),
    );

    Map data = _users.toJson();
    var response = http.post(
        Uri.parse(
            "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/doctors"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data));
    print(data);
  }

  String? chedy;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text('$chedy'),
            SizedBox(
              height: 8,
            ),
            TextField(
                controller: emailController,
                decoration: const InputDecoration()),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration()),
            TextField(
                controller: adressController,
                decoration: const InputDecoration()),
            TextField(
                controller: phoneController,
                decoration: const InputDecoration()),
            TextField(
                controller: civilController,
                decoration: const InputDecoration()),
            TextField(
                controller: firstnameController,
                decoration: const InputDecoration()),
            TextField(
                controller: lastController,
                decoration: const InputDecoration()),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Expanded(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Spécialités',
                    border: OutlineInputBorder(),
                  ),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: specList?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Traitement à effectuer lorsqu'un élément est sélectionné
                            int selectedSpecId = specList![index].id;
                            print(
                                'ID de l\'élément sélectionné: $selectedSpecId');
                            String selectedSpecName = specList![index].name;
                            setState(() {
                              chedy = selectedSpecName;
                              spectController.text = selectedSpecId
                                  .toString(); // mettre à jour la valeur sélectionnée
                            });
                            print(selectedSpecName);
                          },
                          child: ListTile(
                            title: Text(
                              specList?[index].name ?? '',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  registre();
                }),
                child: Text("chedy"))
          ],
        ),
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
