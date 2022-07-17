import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarkScreen extends HookWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarks = useProvider(bookmarkProvider);
    final color = useProvider(colorProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "Bookmark",
            style: TextStyle(color: primaryText, fontSize: 17),
          ),
          actions: [
            IconButton(
                color: primaryText, onPressed: () {}, icon: Icon(Icons.sort)),
          ],
        ),
        body: Center(
          child: Text('Bookmark Screen'),
        ));
  }
}
