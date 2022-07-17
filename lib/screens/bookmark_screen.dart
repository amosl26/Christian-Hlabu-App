import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "Bookmark",
            style: TextStyle(color: primaryText, fontSize: 17),
          ),
        ),
        body: Center(
          child: Text('Bookmark Screen'),
        ));
  }
}
