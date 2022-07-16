import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class ProviderFiles extends ChangeNotifier {
  late bool themeSwitch = true;
  themeGetter() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('appBox');
    var color = await box.get('color');
    if (color == 'light') {
      themeSwitch = true;
      notifyListeners();
    } else {
      themeSwitch = false;
      notifyListeners();
    }
  }

  switching(String cl) async {
    if (cl == 'dark') {
      themeSwitch = false;
      notifyListeners();
    } else {
      themeSwitch = true;
      notifyListeners();
    }
  }
}
