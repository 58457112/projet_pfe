import 'package:flutter/material.dart';
import 'dart:math';

class EmojiScreen extends StatefulWidget {
  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  List<String> _badMessages = [
    "Tout le monde a des moments difficiles, mais cela passera. Tu es fort(e) et tu peux surmonter cela !",
    "N'oublie jamais que tu n'es pas seul(e). Nous sommes là pour toi et nous te soutenons dans cette épreuve.",
    "La vie est faite de hauts et de bas, mais les moments difficiles ne durent pas éternellement. Tu vas t'en sortir !",
    "Le chemin de la vie est parsemé d'obstacles, mais chaque obstacle surmonté te rend plus fort(e). Tu es capable de surmonter cela !",
    "Les temps difficiles ne sont que des occasions de grandir et d'apprendre. Tu en sortiras plus fort(e) et plus sage !"
  ];

  String _badMessage = '';

  void _showMessage(String message) {
    setState(() {
      _badMessage = message;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_badMessage),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _randomBadMessage() {
    final _random = Random();
    String randomMessage = _badMessages[_random.nextInt(_badMessages.length)];
    _showMessage(randomMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.sentiment_very_dissatisfied),
              onPressed: () {
                _randomBadMessage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
