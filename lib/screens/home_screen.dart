import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/screens/sub_screens/sub_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/mainscreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HymnModel> dataModel = [];
  List<String> allCategory = [];

  Future getJson() async {
    dataModel.clear();
    allCategory.clear();

    final String response =
        await rootBundle.loadString('assets/data/hymn_data.json');
    final data = await json.decode(response);
    for (int i = 0; i < data.length; i++) {
      dataModel.add(HymnModel.fromJson(data[i]));
    }

    for (int i = 0; i < dataModel.length; i++) {
      if (!allCategory.contains(dataModel[i].category)) {
        allCategory.add(dataModel[i].category!);
      }
    }
    return true;
  }

  List<HymnModel> getDataInSelectedGenre(String genre) {
    List<HymnModel> result = [];
    for (int i = 0; i < dataModel.length; i++) {
      if (dataModel[i].category!.toLowerCase() == genre.toLowerCase()) {
        result.add(dataModel[i]);
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
          style: TextStyle(color: primaryText, fontSize: 17),
        ),
        actions: [
          IconButton(
            color: primaryText,
            onPressed: () {},
            icon: SvgPicture.asset(
              iconsPath + "search.svg",
              color: primaryText,
            ),
          ),
        ],
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
                                  getDataInSelectedGenre(allCategory[index]);
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
