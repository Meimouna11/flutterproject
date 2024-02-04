import 'package:flutter/material.dart';
import './niveaux_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARCHIVE DE L ISCAE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choisissez les niveaux :',
              style: TextStyle(
                fontSize: 24, // Taille de la police
                color: Colors.black, // Couleur du texte
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelPage(isMaster: false, level: '',semester: '',)), // Ajouter la valeur de level ici
                );
              },
              child: Text(
                'Licence',
                style: TextStyle(
                  fontSize: 20, // Taille de la police
                  color: Colors.black, // Couleur du texte
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Couleur du bouton
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelPage(isMaster: true, level: '',semester: '',)), // Ajouter la valeur de level ici
                );
              },
              child: Text(
                'Master',
                style: TextStyle(
                  fontSize: 20, // Taille de la police
                  color: Colors.black, // Couleur du texte
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Couleur du bouton
              ),
            ),
          ],
        ),
      ),
    );
  }
}
