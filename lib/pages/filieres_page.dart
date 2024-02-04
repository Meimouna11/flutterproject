import 'package:flutter/material.dart';
import './semestres_page.dart';

class BranchPage extends StatelessWidget {
  final bool isMaster;
  final String level;
  final String branch;
  final String semester;

  const BranchPage({Key? key, required this.isMaster, required this.level, required this.branch, required this.semester}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> branches = [];

    if (isMaster) {
      if (level == 'M1' || level == 'M2') {
        branches = ['IG', 'FC'];
      }
    } else {
      if (level == 'L1' || level == 'L2' || level == 'L3') {
        branches = ['IG', 'RT', 'DI', 'FC', 'GRH'];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filières - $level'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: branches.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SemesterPage(
                              isMaster: isMaster,
                              level: level,
                              semester: semester,
                              branch: branches[index],
                            ),
                          ),
                        );
                      },
                      child: Text(
                        branches[index],
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
                    SizedBox(height: 10), // Espace vertical entre les boutons
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
