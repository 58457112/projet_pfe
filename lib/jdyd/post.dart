import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model post.dart';

class Chedy11 extends StatefulWidget {
  const Chedy11({super.key});

  @override
  State<Chedy11> createState() => _Chedy11State();
}

class _Chedy11State extends State<Chedy11> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController civilController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastController = TextEditingController();

  Future<void> registre() async {
    var _users = Users(
      email: emailController.text,
      password: passwordController.text,
      firstName: firstnameController.text,
      lastName: lastController.text,
      civility: civilController.text,
      phoneNumber: phoneController.text,
    );

    Map data = _users.toJson();
    var response = http.post(
        Uri.parse(
            "http://clinic-management-service.eu-west-3.elasticbeanstalk.com/clinic-management-service/api/v1/patients"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data));
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
                controller: emailController,
                decoration: const InputDecoration()),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration()),
            TextField(
                controller: idController, decoration: const InputDecoration()),
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
            ElevatedButton(onPressed: registre, child: Text('bjeh raby ekhdem'))
          ],
        ),
      ),
    );
  }
}
