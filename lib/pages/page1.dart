import 'package:documentation_archivage_app/admin/adminpage.dart';
import 'package:flutter/material.dart';
import '../admin/adminpage.dart'; // Importer la page Home

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archive APP'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Naviguer vers la page Home lorsqu'on clique sur le bouton Admin
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              },
              icon: Icon(Icons.admin_panel_settings), // Icône admin
              label: Text('Admin'), // Texte admin
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Ajoutez votre logique pour le bouton Étudiant
              },
              icon: Icon(Icons.school), // Icône étudiant
              label: Text('Étudiant'), // Texte étudiant
            ),
          ],
        ),
      ),
    );
  }
}
