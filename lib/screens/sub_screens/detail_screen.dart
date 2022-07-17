import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class DetailScreen extends StatefulWidget {
  final int number;
  final String title;
  const DetailScreen(this.number, this.title);
  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: unselectedColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              color: unselectedColor,
              onPressed: () {
                _pdfViewerController.previousPage();
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
            onPressed: () {
              _pdfViewerController.nextPage();
            },
            color: unselectedColor,
            icon: Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {},
            color: unselectedColor,
            icon: Icon(Icons.bookmark),
          ),
          IconButton(
            onPressed: () {},
            color: unselectedColor,
            icon: Icon(Icons.print),
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        'data/christianhlabu.pdf',
        initialZoomLevel: 3.0,
        initialScrollOffset: Offset.fromDirection(10),
        controller: _pdfViewerController,
        pageLayoutMode: PdfPageLayoutMode.single,
        pageSpacing: 4,
        canShowScrollHead: false,
        onDocumentLoaded: (details) {
          _pdfViewerController.jumpToPage(widget.number);
        },
      ),
    );
  }
}
