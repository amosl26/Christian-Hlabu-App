import 'dart:convert';

import 'package:falamhymns/models/hymn_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/sawnawk_model.dart';

class ProviderController with ChangeNotifier {
  List<HymnModel> HymnsInStorage = [];

//  Hymns data
  saveHymnModelInStorage({
    required int pageNumber,
    required int id,
    required String category,
    required String songNumber,
    required String title,
    required bool bookmark,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (HymnsInStorage.indexWhere((element) => element.id == id) != -1) {
      print("exist in storage");
      return;
    }
    HymnsInStorage.add(
        HymnModel(id, pageNumber, songNumber, title, category, bookmark));
    notifyListeners();
    List<String> hymnsInStorageString = [];
    // get the last saved data and convert it to JSON string
    for (var i = 0; i < HymnsInStorage.length; i++) {
      var stringData = converthymnsDataToString(HymnsInStorage[i]);
      hymnsInStorageString.add(stringData);
    }
    // update the phone Storage with The New One with All the Data
    await sharedPreferences.setStringList("hymns", hymnsInStorageString);
  }

  getHymnesDataFromStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? hymnsDataStringFormat =
        sharedPreferences.getStringList("hymns");
    if (hymnsDataStringFormat == null) {
      print("is null for sum reason");
      return;
    }
    if (hymnsDataStringFormat.isNotEmpty) {
      for (var i = 0; i < hymnsDataStringFormat.length; i++) {
        var makeTheDataMapAgine = jsonDecode(hymnsDataStringFormat[i]);
        HymnsInStorage.add(
          HymnModel(
              makeTheDataMapAgine["id"],
              makeTheDataMapAgine["pageNumber"],
              makeTheDataMapAgine["songNumber"],
              makeTheDataMapAgine["title"],
              makeTheDataMapAgine["category"],
              makeTheDataMapAgine["bookmark"]),
        );
      }
    }
  }

  converthymnsDataToString(HymnModel hymnesData) {
    return jsonEncode({
      "id": hymnesData.id,
      "pageNumber": hymnesData.pageNumber,
      "songNumber": hymnesData.songNumber,
      "title": hymnesData.title,
      "bookmark": hymnesData.bookmark,
    });
  }

  removerHymnsFromStorage(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HymnsInStorage.removeWhere((element) => element.id == id);
    notifyListeners();
    List<String> hymnsInStorageString = [];
    for (var i = 0; i < HymnsInStorage.length; i++) {
      var stringData = converthymnsDataToString(HymnsInStorage[i]);
      hymnsInStorageString.add(stringData);
    }
    // update the phone Storage with The New One with All the Data
    await sharedPreferences.setStringList("hymns", hymnsInStorageString);
  }

  //// sawnAWK Storage
  List<SawnAwkModel> SawnInStorage = [];
  deleteAllData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    HymnsInStorage.clear();
    SawnInStorage.clear();
    notifyListeners();
  }

  saveSawnModelInStorage({
    required int pageNumber,
    required int id,
    required String sawnawkNumber,
    required String titleFalam,
    required String titleEnglish,
    required bool bookmark,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (SawnInStorage.indexWhere((element) => element.id == id) != -1) {
      print("exist in storage");
      return;
    }
    SawnInStorage.add(SawnAwkModel(
        id, pageNumber, sawnawkNumber, titleFalam, titleEnglish, bookmark));
    notifyListeners();
    List<String> SawnInStorageString = [];
    // get the last saved data and convert it to JSON string
    for (var i = 0; i < SawnInStorage.length; i++) {
      var stringData = convertSawnDataToString(SawnInStorage[i]);
      SawnInStorageString.add(stringData);
    }
    // update the phone Storage with The New One with All the Data
    sharedPreferences.setStringList("swan", SawnInStorageString);
    print(sharedPreferences.getStringList("swan"));
  }

  getSwanDataFromStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? swanDataStringFormat =
        sharedPreferences.getStringList("swan");
    if (swanDataStringFormat == null) {
      print("is null for sum reason");
      return;
    }
    if (swanDataStringFormat.isNotEmpty) {
      for (var i = 0; i < swanDataStringFormat.length; i++) {
        var makeTheDataMapAgine = jsonDecode(swanDataStringFormat[i]);
        SawnInStorage.add(SawnAwkModel(
          makeTheDataMapAgine["id"],
          makeTheDataMapAgine["pageNumber"],
          makeTheDataMapAgine["sawnawkNumber"],
          makeTheDataMapAgine["titleFalam"],
          makeTheDataMapAgine["titleEnglish"],
          makeTheDataMapAgine["bookmark"],
        ));
      }
    }
  }

  removerSawnFromStorage(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SawnInStorage.removeWhere((element) => element.id == id);
    notifyListeners();
    List<String> sawnInStorageString = [];
    for (var i = 0; i < SawnInStorage.length; i++) {
      var stringData = convertSawnDataToString(SawnInStorage[i]);
      sawnInStorageString.add(stringData);
    }
    // update the phone Storage with The New One with All the Data
    await sharedPreferences.setStringList("swan", sawnInStorageString);
  }

  convertSawnDataToString(SawnAwkModel sawnAwkModel) {
    return jsonEncode({
      "id": sawnAwkModel.id,
      "pageNumber": sawnAwkModel.pageNumber,
      "sawnawkNumber": sawnAwkModel.sawnawkNumber,
      "titleFalam": sawnAwkModel.titleFalam,
      "titleEnglish": sawnAwkModel.titleEnglish,
      "bookmark": sawnAwkModel.bookmark,
    });
  }
}
