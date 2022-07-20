import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/provider_controller.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart' as provider;

class DetailScreen extends StatefulWidget {
  final String songNumber;
  final int pageNumber;
  final int id;
  final String title;
  final bool isHymns;
  final String category;
  final SawnAwkModel? sawnawk;
  bool bookmark;

  DetailScreen(this.id, this.pageNumber, this.title, this.bookmark,
      this.songNumber, this.sawnawk, this.category,
      {required this.isHymns});
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
        elevation: 0,
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
          provider.Consumer<ProviderController>(
            builder: (context, data, child) {
              bool marked;
              if (widget.isHymns) {
                if (data.HymnsInStorage.indexWhere(
                        (element) => element.id == widget.id) ==
                    -1) {
                  marked = false;
                } else {
                  marked = true;
                }
              } else {
                if (data.SawnInStorage.indexWhere(
                        (element) => element.id == widget.id) ==
                    -1) {
                  marked = false;
                } else {
                  marked = true;
                }
              }

              return IconButton(
                onPressed: () async {
                  if (widget.isHymns) {
                    if (marked) {
                      data.removerHymnsFromStorage(widget.id);
                    } else {
                      await data.saveHymnModelInStorage(
                        id: widget.id,
                        pageNumber: widget.pageNumber,
                        songNumber: widget.songNumber,
                        title: widget.title,
                        category: widget.category,
                        bookmark: widget.bookmark,
                      );
                    }
                  } else {
                    if (marked) {
                      await data.removerSawnFromStorage(widget.id);
                    } else {
                      await data.saveSawnModelInStorage(
                          pageNumber: widget.pageNumber,
                          id: widget.id,
                          sawnawkNumber: widget.sawnawk!.sawnawkNumber,
                          titleFalam: widget.sawnawk!.titleFalam,
                          titleEnglish: widget.sawnawk!.titleEnglish,
                          bookmark: widget.bookmark);
                    }
                  }
                },
                color: primaryText,
                icon: Icon(marked == true
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined),
              );
            },
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
          _pdfViewerController.jumpToPage(widget.pageNumber);
        },
      ),
    );
  }
}
