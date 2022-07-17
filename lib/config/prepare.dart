import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/sub_screens/splash_screen.dart';
import 'bottom_bar.dart';

class Prepare extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bookmark = useProvider(bookmarkProvider);
    final color = useProvider(colorProvider);

    startSequence() async {
      await Hive.initFlutter();
      var box = await Hive.openBox('appBox');

      if (box.get('color') != null) {
        color.state = box.get('color');
      }

      if (box.get('bookmarks') != null) {
        bookmark.state = jsonDecode(box.get('bookmarks'));
      }

      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomBar()),
          (Route<dynamic> route) => false);
    }

    useEffect(() {
      startSequence();
    }, const []);

    return Scaffold(
      body: Container(
        color: primaryBg,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
