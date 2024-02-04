import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:video_player/video_player.dart'; // Importez le package video_player pour la lecture de vidéos

class DocumentViewer extends StatelessWidget {
  final String documentContent; // Le contenu du document à afficher
  final String documentType; // Le type du document

  const DocumentViewer({Key? key, required this.documentContent, required this.documentType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
      ),
      body: Center(
        child: _buildDocumentWidget(), // Appel à une fonction pour construire le widget approprié en fonction du type de document
      ),
    );
  }

  Widget _buildDocumentWidget() {
    // Vérifier le type de document et retourner le widget approprié
    if (documentType == 'pdf') {
      // Afficher un PDF
      return PDFView(
        filePath: documentContent,
        // Autres propriétés de configuration du PDFView
      );
    } else if (documentType == 'image') {
      // Afficher une image
      return Image.asset(
        documentContent,
        // Autres propriétés de configuration de l'image
      );
    } else if (documentType == 'video') {
      // Afficher une vidéo
      return VideoPlayerWidget(
        videoPath: documentContent,
        // Autres propriétés de configuration du VideoPlayerWidget
      );
    } else {
      // Afficher un message d'erreur pour les types de documents non pris en charge
      return Text('Type de document non pris en charge');
    }
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CircularProgressIndicator();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
