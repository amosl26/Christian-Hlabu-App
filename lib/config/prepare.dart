import 'dart:convert';

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
    final bookmarks = useProvider(bookmarksProvider);
    final color = useProvider(colorProvider);
    final boarded = useState('no');

    startSequence() async {
      await Hive.initFlutter();
      var box = await Hive.openBox('appBox');

      if (box.get('color') != null) {
        color.state = box.get('color');
      }

      if (box.get('bookmarks') != null) {
        bookmarks.state = jsonDecode(box.get('bookmarks'));
      }

      if (box.get('boarded') != null) {
        boarded.value = await box.get('boarded');
      }
      await Future.delayed(Duration(seconds: 2));
      if (boarded.value == 'no') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Dashboard()),
            (Route<dynamic> route) => false);
      }
    }

    useEffect(() {
      startSequence();
    }, const []);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashScreen(24, "dark"),
            ],
          ),
        ),
      ),
    );
  }
}
