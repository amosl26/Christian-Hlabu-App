import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "Categories",
            style: TextStyle(color: primaryText, fontSize: 17),
          ),
          actions: [
            IconButton(
              color: primaryText,
              onPressed: () {},
              icon: SvgPicture.asset(
                iconsPath + "search.svg",
                color: primaryText,
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  "Home Screen",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}
