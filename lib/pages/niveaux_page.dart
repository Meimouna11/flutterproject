import 'package:flutter/material.dart';
import './filieres_page.dart'; // Importer la page suivante

class LevelPage extends StatelessWidget {
  final bool isMaster;
  final String level;
  final String semester;

  const LevelPage({Key? key, required this.isMaster, required this.level, required this.semester}) : super(key: key); // Ajouter const et Key

  @override
  Widget build(BuildContext context) {
    List<String> levels = []; // Définir une liste de niveaux

    if (isMaster) {
      // Si c'est un programme de master, définissez les niveaux M1 et M2
      levels = ['M1', 'M2'];
    } else {
      // Sinon, c'est un programme de licence, définissez les niveaux L1, L2 et L3
      levels = ['L1', 'L2', 'L3'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isMaster ? 'Niveaux Master' : 'Niveaux Licence'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Utiliser ListView.builder pour afficher dynamiquement les niveaux
            ListView.builder(
              shrinkWrap: true, // Ajouter cette ligne pour éviter l'erreur de hauteur illimitée
              itemCount: levels.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BranchPage(
                              isMaster: isMaster,
                              semester: semester,
                              level: levels[index], // Passer le niveau sélectionné à la page suivante
                              branch: 'dummy', // Ajouter un exemple de branche, vous devez passer une branche réelle ici
                            ),
                          ),
                        );
                      },
                      child: Text(
                        levels[index],
                        style: TextStyle(
                          fontSize: 20, // Taille de la police
                          color: Colors.black, // Couleur du texte
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Couleur du bouton
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajuster le rembourrage du bouton
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // Forme du bouton
                      ),
                    ),
                    SizedBox(height: 10), // Espacement entre les boutons
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

