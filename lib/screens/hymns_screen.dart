import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/widget/hymn_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HymnsScreen extends StatefulWidget {
  HymnsScreen({Key? key}) : super(key: key);

  @override
  State<HymnsScreen> createState() => _HymnsScreenState();
}

class _HymnsScreenState extends State<HymnsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "All Hymns",
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
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
        future: ReadHymnJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<HymnModel>;

            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return HymnsCardWidget(
                    id: items[index].id!,
                    pageNumber: items[index].pageNumber,
                    title: items[index].title,
                    bookmark: items[index].bookmark,
                    songNumber: items[index].songNumber,
                    category: items[index].category,
                    isVisible: false,
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.sort_by_alpha_outlined),
              backgroundColor: Colors.white,
              label: 'Sort by alphabet',
              onTap: () => print('FIRST CHILD')),
          SpeedDialChild(
            child: Icon(Icons.format_list_numbered),
            backgroundColor: Colors.white,
            label: 'Sort by number',
            onTap: () => print('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: SvgPicture.asset(
              iconsPath + "search.svg",
              color: primaryText,
            ),
            label: 'Search by number or title',
            backgroundColor: Colors.white,
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
    );
  }
}

Future<List<HymnModel>> ReadHymnJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/data/hymn_data.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => HymnModel.fromJson(e)).toList();
}
