import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Importez le package FilePicker
import './document_viewer.dart'; // Importez le widget DocumentViewer

class DocumentPage extends StatefulWidget {
  final bool isMaster;
  final String level;
  final String branch;
  final String semester;
  final String documentType;

  const DocumentPage({
    Key? key,
    required this.isMaster,
    required this.level,
    required this.branch,
    required this.semester,
    required this.documentType,
  }) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  // Liste des documents à afficher
  List<String> documents = [];

  // Fonction pour permettre à l'utilisateur de sélectionner un document
  Future<void> selectDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        // Ajouter le document sélectionné à la liste
        setState(() {
          documents.add(filePath);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.documentType} - ${widget.semester}'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: documents.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(documents[index]),
              onTap: () {
                // Naviguer vers le DocumentViewer avec le contenu du document
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentViewer(
                      documentContent: documents[index],
                      documentType: determineDocumentType(documents[index]),
                    ),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Implémentez votre logique pour la modification du document
                      print('Modifier le document ${documents[index]}');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Supprimer le document de la liste
                      setState(() {
                        documents.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Permettre à l'utilisateur de sélectionner un document à ajouter
          selectDocument();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Fonction pour déterminer le type de document en fonction de son extension de fichier
  String determineDocumentType(String documentName) {
    if (documentName.endsWith('.pdf')) {
      return 'pdf';
    } else if (documentName.endsWith('.jpg') ||
        documentName.endsWith('.jpeg') ||
        documentName.endsWith('.png')) {
      return 'image';
    } else {
      return 'autre';
    }
  }
}
