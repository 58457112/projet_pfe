import 'package:flutter/material.dart';

class Qare extends StatefulWidget {
  const Qare({super.key});

  @override
  State<Qare> createState() => _QareState();
}

class _QareState extends State<Qare> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Accueil'),
    Text('Profil'),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.greenAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.greenAccent,
            ),
            label: 'Profil',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            'Helath Bridge ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent[700]),
          )),
          SizedBox(
            height: 30,
          ),
          Text(
            'Bonjour Chedy!',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 300,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today,
                    size: 30, color: Colors.greenAccent[700]),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Prendre rendez-vous avec un praticien',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Mes Consultations',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(0);
                    },
                    child: Text(
                      "Passées",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == 0
                              ? Colors.greenAccent[700]
                              : Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _onItemTapped(1);
                    },
                    child: Text(
                      "A venir",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _selectedIndex == 1
                              ? Colors.greenAccent[700]
                              : Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              _selectedIndex == 0 ? Interface1() : Interface2(),
            ],
          ),
        ],
      ),
    );
  }
}

class Interface1 extends StatelessWidget {
  const Interface1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "' Vous n'avez pas encore réalise de consultation sur Health Bridge '",
              style: TextStyle(color: Colors.greenAccent[400], fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Ici s'affichera l'ensemble de vos consultation passées :détail(s) de la consultation ",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Interface2 extends StatelessWidget {
  const Interface2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Text(
              "' Vous n'avez aucune consultation prévue pour le moment '",
              style: TextStyle(color: Colors.greenAccent[400], fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Plus de 69 spécialités disponible en consultation Health Bridge ",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
