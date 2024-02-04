import 'package:flutter/material.dart';
import '../etudient/etudiant.dart'; // Importez la classe Etudiant

class AjouterEtudiantPage extends StatefulWidget {
  @override
  _AjouterEtudiantPageState createState() => _AjouterEtudiantPageState();
}

class _AjouterEtudiantPageState extends State<AjouterEtudiantPage> {
  late TextEditingController _nomController;
  late TextEditingController _matriculeController;

  // Liste des étudiants
  List<Etudiant> _etudiants = [];

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController();
    _matriculeController = TextEditingController();
  }

  @override
  void dispose() {
    _nomController.dispose();
    _matriculeController.dispose();
    super.dispose();
  }

  void _ajouterEtudiant() {
    String nom = _nomController.text;
    String matricule = _matriculeController.text;

    // Créer une instance de l'étudiant avec les données saisies
    Etudiant nouvelEtudiant = Etudiant(nom: nom, matricule: matricule);

    setState(() {
      // Ajouter le nouvel étudiant à la liste
      _etudiants.add(nouvelEtudiant);
    });

    // Effacer les champs de texte après l'ajout
    _nomController.clear();
    _matriculeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un étudiant'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nomController,
              decoration: InputDecoration(
                labelText: 'Nom de l\'étudiant',
              ),
            ),
            TextFormField(
              controller: _matriculeController,
              decoration: InputDecoration(
                labelText: 'Matricule de l\'étudiant',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _ajouterEtudiant();
              },
              child: Text('Ajouter'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _etudiants.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_etudiants[index].nom),
                    subtitle: Text(_etudiants[index].matricule),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Implémentez votre logique de modification ici
                            print('Modifier l\'étudiant ${_etudiants[index].nom}');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              // Supprimer l'étudiant de la liste
                              _etudiants.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
