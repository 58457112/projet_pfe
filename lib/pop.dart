import 'package:flutter/material.dart';
import 'dart:math';

class EmojiScreen extends StatefulWidget {
  @override
  _EmojiScreenState createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  List<String> _happyMessages = [
    "Bonjour ! Nous vous souhaitons une excellente journée pleine de bonheur et de réussite !",
    "Souriez, aujourd'hui est une nouvelle journée pleine de possibilités !",
    "Prenez une profonde respiration, fermez les yeux et imaginez une journée incroyable devant vous.",
    "La clé du succès est de se lever chaque fois que l'on tombe. Alors, allez-y, conquérez cette journée !",
    "Saviez-vous que rire pendant seulement 10 minutes par jour peut réduire le stress et améliorer votre humeur ? Allez-y, trouvez quelque chose à rire aujourd'hui !"
  ];
  List<String> _badMessages = [
    "Tout le monde a des moments difficiles, mais cela passera. Tu es fort(e) et tu peux surmonter cela !",
    "N'oublie jamais que tu n'es pas seul(e). Nous sommes là pour toi et nous te soutenons dans cette épreuve.",
    "La vie est faite de hauts et de bas, mais les moments difficiles ne durent pas éternellement. Tu vas t'en sortir !",
    "Le chemin de la vie est parsemé d'obstacles, mais chaque obstacle surmonté te rend plus fort(e). Tu es capable de surmonter cela !",
    "Les temps difficiles ne sont que des occasions de grandir et d'apprendre. Tu en sortiras plus fort(e) et plus sage !"
  ];
  String _message = '';

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_message),
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

  void _randomHappyMessage() {
    final _random = Random();
    String randomMessage =
        _happyMessages[_random.nextInt(_happyMessages.length)];
    _showMessage(randomMessage);
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
              color: Colors.black,
              icon: Icon(Icons.emoji_emotions),
              onPressed: _randomHappyMessage,
            ),
            IconButton(
              color: Colors.black,
              icon: Icon(Icons.emoji_emotions),
              onPressed: _randomBadMessage,
            ),
          ],
        ),
      ),
    );
  }
}
////////////hedhiiii eli tekhdemm////////