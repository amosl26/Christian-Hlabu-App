import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "All Hymns",
            style: TextStyle(color: primaryText, fontSize: 17),
          ),
          actions: [
            IconButton(
              color: primaryText,
              onPressed: () {},
              icon: SvgPicture.asset(
                iconsPath + "search.svg",
                color: selectedColor,
              ),
            ),
            IconButton(
                color: primaryText,
                onPressed: () {},
                icon: Icon(Icons.sort_by_alpha)),
          ],
        ),
        body: Center(
          child: Text('Hymns Screen'),
        ));
  }
}
