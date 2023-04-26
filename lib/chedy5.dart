import 'dart:math';
import 'dart:ui';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sabri/pop.dart';

class Hahaha extends StatefulWidget {
  const Hahaha({super.key});

  @override
  State<Hahaha> createState() => _HahahaState();
}

class _HahahaState extends State<Hahaha> {
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
  List<String> _fineMessages = [
    "Tu as fait un excellent travail aujourd'hui, continue comme ça !",
    "Chaque jour est une nouvelle opportunité pour briller. Continue de faire de ton mieux !",
    "Tu es vraiment incroyable ! Tu as accompli tellement de choses et tu es sur la bonne voie.",
    "Tes efforts ne passent pas inaperçus. Nous sommes fiers de toi et nous croyons en toi !",
    "Rappelez-vous que vous êtes un(e) battant(e) ! Vous avez surmonté tant de choses et vous pouvez tout conquérir."
  ];
  List<String> _excellentAchievements = [
    "Tu as réussi à terminer un projet important dans les délais impartis. Bravo !",
    "Tes efforts pour t'améliorer constamment ont porté leurs fruits. Continue de progresser !",
    "Tu as fait preuve d'un grand courage pour surmonter un obstacle difficile. Tu es inspirant(e) !",
    "Tu as eu une conversation difficile avec quelqu'un et tu t'en es sorti(e) avec grâce et empathie. Tu es un(e) véritable modèle !",
    "Tu as pris une décision courageuse pour ton bien-être et tu as suivi avec succès. Félicitations !"
  ];

  String _badMessage = '';
  String _happyMessage = '';
  String _fineMessage = '';
  String _excellentAchievement = '';

  void _showMessage(String message) {
    setState(() {
      _happyMessage = message;
      _badMessage = message;
      _fineMessage = message;
      _excellentAchievement = message;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_happyMessage),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_fineMessage),
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(_excellentAchievement),
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

  void _randomFineMessage() {
    final _random = Random();
    String randomMessage = _fineMessages[_random.nextInt(_fineMessages.length)];
    _showMessage(randomMessage);
  }

  void _randomExcellentAchievement() {
    final _random = Random();
    String randomAchievement =
        _excellentAchievements[_random.nextInt(_excellentAchievements.length)];
    _showMessage(randomAchievement);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '')
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Chedy!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10/03/2023',
                            style: TextStyle(color: Colors.blue[100]),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How de you feel ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.amber,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    _randomHappyMessage();
                                  },
                                ),
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Happy',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: IconButton(
                                icon: Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.amber,
                                  size: 35,
                                ),
                                onPressed: () {
                                  _randomBadMessage();
                                },
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Bad',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: IconButton(
                                icon: Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.amber,
                                  size: 35,
                                ),
                                onPressed: () {
                                  _randomFineMessage();
                                },
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Fine',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: IconButton(
                                icon: Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.amber,
                                  size: 35,
                                ),
                                onPressed: () {
                                  _randomExcellentAchievement();
                                },
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Excellent',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Contenu de votre Container
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50, right: 50),
                          child: Center(
                            child: Text(
                              "Today's Appointment",
                              style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Arrière-plan flou
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.55,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  // Image en arrière-plan
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      child: Image.network(
                        'https://i.pinimg.com/564x/d2/af/af/d2afafe06aae0b32acdc7c1cd8916f68.jpg',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
