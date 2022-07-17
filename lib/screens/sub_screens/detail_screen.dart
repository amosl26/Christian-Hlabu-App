import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class DetailScreen extends StatefulWidget {
  final int number;
  final String title;
  bool bookmark;
  DetailScreen(this.number, this.title, this.bookmark);
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
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          widget.title,
          style: TextStyle(color: primaryText, fontSize: 15),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: primaryText),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
              color: primaryText,
              onPressed: () {
                _pdfViewerController.previousPage();
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
            onPressed: () {
              _pdfViewerController.nextPage();
            },
            color: primaryText,
            icon: Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              print(widget.bookmark);
              setState(() => widget.bookmark = !widget.bookmark);
            },
            color: primaryText,
            icon: Icon(widget.bookmark == true
                ? Icons.bookmark
                : Icons.bookmark_add_outlined),
          ),
          IconButton(
            onPressed: () {},
            color: primaryText,
            icon: Icon(Icons.print_outlined),
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        'assets/data/christianhlabu.pdf',
        initialZoomLevel: 3.0,
        enableDoubleTapZooming: true,
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
