import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/hymn_model.dart';
import 'package:falamhymns/widget/hymn_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "All Hymns",
            style: TextStyle(color: primaryText, fontSize: 17),
          ),
          actions: [
            IconButton(
              color: primaryText,
              onPressed: () {},
              icon: SvgPicture.asset(
                iconsPath + "search.svg",
                color: selectedColor,
              ),
            ),
            IconButton(
                color: primaryText,
                onPressed: () {},
                icon: Icon(Icons.sort_by_alpha)),
          ],
        ),
        body: FutureBuilder(
          future: ReadJsonDate(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<HymnModel>;

              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return HymnsCardWidget(
                      pageNumber: items[index].pageNumber,
                      title: items[index].title,
                      bookmark: items[index].bookmark,
                      songNumber: items[index].songNumber,
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

Future<List<HymnModel>> ReadJsonDate() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/data/hymn_data.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => HymnModel.fromJson(e)).toList();
}
