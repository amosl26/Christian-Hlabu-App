import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "All Hymns",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          actions: [
            IconButton(
              color: unselectedColor,
              onPressed: () {},
              icon: SvgPicture.asset(
                iconsPath + "search.svg",
                color: selectedColor,
              ),
            ),
          ],
        ),
        body: Center(
          child: Text('Songs Screen'),
        ));
  }
}
