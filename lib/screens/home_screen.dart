import 'dart:convert';
import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/screens/sub_screens/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HymnModel> hymnModel = [];
  List<String> allCategory = [];

  Future getJson() async {
    hymnModel.clear();
    allCategory.clear();

    final String response =
        await rootBundle.loadString('assets/data/hymn_data.json');
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      hymnModel.add(HymnModel.fromJson(data[i]));
    }

    for (int i = 0; i < hymnModel.length; i++) {
      if (!allCategory.contains(hymnModel[i].category)) {
        allCategory.add(hymnModel[i].category!);
      }
    }
    return true;
  }

  List<HymnModel> getDataInSelectedCategory(String category) {
    List<HymnModel> result = [];
    for (int i = 0; i < hymnModel.length; i++) {
      if (hymnModel[i].category!.toLowerCase() == category.toLowerCase()) {
        result.add(hymnModel[i]);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "Categories",
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: getJson(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            if (snap.data == true) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            onTap: () {
                              List<HymnModel> data =
                                  getDataInSelectedCategory(allCategory[index]);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      SubCategoryScreen(data: data)));
                            },
                            leading: Text(index.toString()),
                            title: Text(allCategory[index]),
                          );
                        },
                        separatorBuilder: (BuildContext context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: allCategory.length),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
