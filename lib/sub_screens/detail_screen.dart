import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class DetailScreen extends StatefulWidget {
  final int number;
  const DetailScreen(this.number);
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
          title: Text('Falam Hymn Hlabu'),
          actions: <Widget>[],
        ),
        body: SfPdfViewer.asset(
          'data/christianhlabu.pdf',
          initialZoomLevel: 2,
          initialScrollOffset: Offset.fromDirection(10),
          controller: _pdfViewerController,
          pageLayoutMode: PdfPageLayoutMode.single,
          pageSpacing: 4,
          canShowScrollHead: false,
          onDocumentLoaded: (details) {
            _pdfViewerController.jumpToPage(widget.number);
          },
        ));
  }
}
