// document_type_page.dart
import 'package:flutter/material.dart';
import './documentpage.dart'; // Importer la page des documents

class DocumentTypePage extends StatelessWidget {
  final bool isMaster;
  final String level;
  final String branch;
  final String semester;

  const DocumentTypePage({
    Key? key,
    required this.isMaster,
    required this.level,
    required this.branch,
    required this.semester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Liste des types de documents
    List<String> documentTypes = ['COURS', 'TP', 'DEVOIRS', 'EXAMENS']; // Mettre en majuscules

    return Scaffold(
      appBar: AppBar(
        title: Text('Documents - $semester'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: documentTypes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(documentTypes[index]), // Utiliser la casse correcte
              onTap: () {
                // Naviguer vers la page des documents correspondante au type sélectionné
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentPage(
                      isMaster: isMaster,
                      level: level,
                      branch: branch,
                      semester: semester,
                      documentType: documentTypes[index], // Utiliser la casse correcte
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
