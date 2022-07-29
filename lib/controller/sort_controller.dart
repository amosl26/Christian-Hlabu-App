import 'dart:convert';

import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class SortController with ChangeNotifier {
  List<HymnModel> hymnItems = [];
  List<SawnAwkModel> sawnawkItems = [];

  sortSawnawkByNumbers() async {
    sawnawkItems.sort((a, b) {
      return a.id!.compareTo(b.id!);
    });
    notifyListeners();
  }

  readHymnJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/hymn_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    for (var i = 0; i < list.length; i++) {
      hymnItems.add(HymnModel.fromJson(list[i]));
    }
    notifyListeners();
  }

  sortHymnbyAlphabet() async {
    hymnItems.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    notifyListeners();
  }

  sortHymnByNumbers() async {
    hymnItems.sort((a, b) {
      return a.id!.compareTo(b.id!);
    });
    notifyListeners();
  }

  readSawnawkJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/sawnawk_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    for (var i = 0; i < list.length; i++) {
      sawnawkItems.add(SawnAwkModel.fromJson(list[i]));
    }
    notifyListeners();
  }

  sortSawnawkbyAlphabet() async {
    sawnawkItems.sort((a, b) {
      return a.titleFalam.toLowerCase().compareTo(b.titleFalam.toLowerCase());
    });
    notifyListeners();
  }
}
