import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Favorites",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        body: Center(
          child: Text('Favorite Screen'),
        ));
  }
}
