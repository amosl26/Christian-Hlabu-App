import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:falamhymns/widget/sawnawk_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

class SawnawkScreen extends StatelessWidget {
  const SawnawkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "Sawnawk Bible",
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
          future: ReadSawnawkJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<SawnAwkModel>;

              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return SawnawkCardWidget(
                      id: items[index].id!,
                      pageNumber: items[index].pageNumber,
                      titleFalam: items[index].titleFalam,
                      bookmark: items[index].bookmark,
                      sawnawkNumber: items[index].sawnawkNumber,
                      titleEnglish: items[index].titleEnglish,
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

Future<List<SawnAwkModel>> ReadSawnawkJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/data/sawnawk_data.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => SawnAwkModel.fromJson(e)).toList();
}
