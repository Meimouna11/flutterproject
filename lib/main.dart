import 'package:flutter/material.dart';
import './pages/page1.dart'; // Importez le fichier home_page.dart


void main() async {
 
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChoicePage(), // Définissez la page HomePage comme page d'accueil
    );
  }
}
