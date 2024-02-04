import 'package:flutter/material.dart';
import './gestion_etudiants_page.dart'; // Importer la page de gestion des étudiants
import '../pages/home_page.dart'; // Importer la page d'accueil

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de gestion des étudiants
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AjouterEtudiantPage(),
                  ),
                );
              },
              child: Text('Gérer les étudiants'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page d'accueil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Accéder aux documents'),
            ),
          ],
        ),
      ),
    );
  }
}
