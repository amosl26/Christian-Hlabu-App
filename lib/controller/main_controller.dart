import 'dart:convert';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class MainController with ChangeNotifier {
  List<HymnModel> hymnItems = [];
  List<SawnAwkModel> sawnawkItems = [];

  List<HymnModel> hymnModel = [];
  List<String> allCategory = [];

  getHymnCategory() async {
    hymnModel.clear();
    allCategory.clear();

    final String response =
        await rootBundle.rootBundle.loadString('assets/data/hymn_data.json');
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      hymnModel.add(HymnModel.fromJson(data[i]));
    }

    for (int i = 0; i < hymnModel.length; i++) {
      if (!allCategory.contains(hymnModel[i].category)) {
        allCategory.add(hymnModel[i].category!);
      }
    }

    notifyListeners();
    return true;
  }

  List<HymnModel> getDataInSelectedCategory(String category) {
    List<HymnModel> result = [];
    for (int i = 0; i < hymnModel.length; i++) {
      if (hymnModel[i].category!.toLowerCase() == category.toLowerCase()) {
        result.add(hymnModel[i]);
      }
    }
    notifyListeners();
    return result;
  }

  getHymnJsonData() async {
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

  getSawnawkJsonData() async {
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

  sortSawnawkByNumbers() async {
    sawnawkItems.sort((a, b) {
      return a.id!.compareTo(b.id!);
    });
    notifyListeners();
  }
}
