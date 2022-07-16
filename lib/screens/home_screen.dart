import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class HomeScreen extends StatefulWidget {
  @override
  __HomeScreen createState() => __HomeScreen();
}

class __HomeScreen extends State<HomeScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  late PdfViewerController _pdfViewerController;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              "Home Screen",
              style: TextStyle(fontSize: 24),
            ),
          ),
          RaisedButton(
            child: Text(
              'Open Page 200 for testing',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(200),
                  ));
            },
          )
        ],
      ),
    ));
  }
}
