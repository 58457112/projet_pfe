import 'package:flutter/material.dart';
import 'package:sabri/rendezVous.dart';

class RendezVousList extends StatelessWidget {
  const RendezVousList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des rendez-vous'),
      ),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final rendezVous = _list[index];
          return ListTile(
            title: Text(rendezVous.toDo ?? ''),
            subtitle: Text(rendezVous.time?.toString() ?? ''),
          );
        },
      ),
    );
  }
}
