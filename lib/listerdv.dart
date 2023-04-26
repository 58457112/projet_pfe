import 'package:flutter/material.dart';

class Chedy4 extends StatefulWidget {
  const Chedy4({super.key});

  @override
  State<Chedy4> createState() => _Chedy4State();
}

class _Chedy4State extends State<Chedy4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/e8/57/cf/e857cfedd76d3c814bb16328c7573919.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 231, 207, 207).withOpacity(
                  0.30), // Augmenter l'opacité à 0.8 pour un flou plus prononcé
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}
