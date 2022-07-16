import 'dart:convert';

import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class SawnawkScreen extends StatelessWidget {
  const SawnawkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ReadJsonDate(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<SawnAwkModel>;

          return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: new InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(items[index].pageNumber),
                          ));
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(items[index].titleFalam.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(items[index].titleEnglish.toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

Future<List<SawnAwkModel>> ReadJsonDate() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('data/sawnawk_data.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => SawnAwkModel.fromJson(e)).toList();
}
