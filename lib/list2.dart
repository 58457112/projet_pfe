import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        key: _globalKey,
        child: Stack(
          children: [
            Image.network(
              'https://i.pinimg.com/564x/d2/af/af/d2afafe06aae0b32acdc7c1cd8916f68.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.6),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 100,
              right: 20,
              top: 20,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Helath Bridge',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 100,
              child: Container(
                child: Center(child: Text('Patient1')),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Positioned(
              left: 20,
              right: 20,
              top: 220,
              child: Container(
                child: Center(child: Text('Patient2')),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
