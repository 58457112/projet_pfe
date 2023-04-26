import 'package:flutter/material.dart';

class Besoin extends StatefulWidget {
  const Besoin({Key? key}) : super(key: key);

  @override
  State<Besoin> createState() => _BesoinState();
}

class _BesoinState extends State<Besoin> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Bonjour',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.waving_hand,
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "L'equipe Support Patient est composée d'opérateurs formés a vous accompagner sur Health Bridge , et a repondre a touters vos questions",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _toggleExpanded,
              child: Text(
                'Tu ne comprends pas comment t\'inscrire ?',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Pour t\'inscrire, tu dois remplir un formulaire en ligne avec tes informations personnelles.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
