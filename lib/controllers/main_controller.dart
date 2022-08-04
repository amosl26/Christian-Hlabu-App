import 'dart:convert';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:collection/collection.dart';

enum SortTypeForHymns {
  sortByAlpabet,
  sortByNumbers,
}

enum SortTypeForSawna {
  sortByAlpabet,
  sortByNumbers,
}

class MainController with ChangeNotifier {
  List<String> allCategory = [];
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  List<String> alphabetsExistForSawnawk = [];

  /// hymnas only
  List<String> alphabetsExistForHymna = [];
  List<HymnModel> hymnItems = [];
  SortTypeForHymns sortTypeHymns = SortTypeForHymns.sortByNumbers;
  List<int> numbersExitForHymna = [];

  prepareHymnsForSort() async {
    await getHymnJsonData();
    await getTheAlphaBForHyma();
    await getAllTheNumberForHymna();
    notifyListeners();
  }

  getAllTheNumberForHymna() {
    var thelenth = (hymnItems.length / 50).floor();
    var first = 50;
    for (var i = 0; i < thelenth + 1; i++) {
      var newvalue = first * i;
      numbersExitForHymna.add(newvalue);
    }
  }

  getHymnCategory() async {
    allCategory.clear();
    final String response =
        await rootBundle.rootBundle.loadString('assets/data/hymn_data.json');
    final data = await json.decode(response);
    List<HymnModel> datahymns = [];
    for (int i = 0; i < data.length; i++) {
      datahymns.add(HymnModel.fromJson(data[i]));
    }
    for (int i = 0; i < datahymns.length; i++) {
      if (!allCategory.contains(datahymns[i].category)) {
        allCategory.add(datahymns[i].category);
      }
    }
    notifyListeners();
    return true;
  }

  List<HymnModel> getDataInSelectedCategory(String category) {
    List<HymnModel> result = [];
    for (int i = 0; i < hymnItems.length; i++) {
      if (hymnItems[i].category.toLowerCase() == category.toLowerCase()) {
        result.add(hymnItems[i]);
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
  }

  sortHymnbyAlphabet() async {
    hymnItems.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    sortTypeHymns = SortTypeForHymns.sortByAlpabet;
    notifyListeners();
  }

  sortHymnByNumbers() async {
    hymnItems.sort((a, b) {
      return a.id!.compareTo(b.id!);
    });
    sortTypeHymns = SortTypeForHymns.sortByNumbers;
    notifyListeners();
  }

  getTheAlphaBForHyma() async {
    alphabetsExistForHymna.clear();
    for (var i = 0; i < alphabets.length; i++) {
      HymnModel? isExist = hymnItems.firstWhereOrNull(
          (element) => element.title.startsWith(alphabets[i]));
      if (isExist != null) {
        alphabetsExistForHymna.add(alphabets[i]);
      }
    }
  }

// sawanawak
  SortTypeForSawna sortTypeSawna = SortTypeForSawna.sortByNumbers;
  List<SawnAwkModel> sawnawkItems = [];
  List<int> numbersExitForSawna = [];
  getThingReadyForTheSawna() async {
    await getSawnawkJsonData();
    await getTheAlphaBForSawan();
    await getAllTheNumberForSawan();
    notifyListeners();
  }

  getSawnawkJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/sawnawk_data.json');
    final list = json.decode(jsondata) as List<dynamic>;
    for (var i = 0; i < list.length; i++) {
      sawnawkItems.add(SawnAwkModel.fromJson(list[i]));
    }
  }

  sortSawnawkbyAlphabet() async {
    sawnawkItems.sort((a, b) {
      return a.titleFalam.toLowerCase().compareTo(b.titleFalam.toLowerCase());
    });
    sortTypeSawna = SortTypeForSawna.sortByAlpabet;
    notifyListeners();
  }

  getTheAlphaBForSawan() async {
    for (var i = 0; i < alphabets.length; i++) {
      SawnAwkModel? isExist = sawnawkItems.firstWhereOrNull(
          (element) => element.titleFalam.startsWith(alphabets[i]));
      if (isExist != null) {
        alphabetsExistForSawnawk.add(alphabets[i]);
      }
    }
  }

  sortSawnawkByNumbers() async {
    sawnawkItems.sort((a, b) {
      return a.id!.compareTo(b.id!);
    });
    sortTypeSawna = SortTypeForSawna.sortByNumbers;
    notifyListeners();
  }

  getAllTheNumberForSawan() {
    var thelenth = (sawnawkItems.length / 20).floor();
    var first = 20;
    for (var i = 0; i < thelenth + 1; i++) {
      var newvalue = first * i;
      numbersExitForSawna.add(newvalue);
    }
  }
}
