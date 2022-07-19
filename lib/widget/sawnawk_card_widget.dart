import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SawnawkCardWidget extends HookWidget {
  final int pageNumber;
  final int id;
  final String sawnawkNumber;
  final String titleFalam;
  final String titleEnglish;
  bool bookmark;

  SawnawkCardWidget({
    required this.id,
    required this.pageNumber,
    required this.sawnawkNumber,
    required this.bookmark,
    required this.titleFalam,
    required this.titleEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      id,
                      pageNumber,
                      titleFalam,
                      bookmark,
                      sawnawkNumber,
                      SawnAwkModel(
                        id,
                        pageNumber,
                        sawnawkNumber,
                        titleFalam,
                        titleEnglish,
                        bookmark,
                      ),
                      isHymns: false,
                    )))
      },
      child: Container(
        height: 90,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        sawnawkNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        titleFalam,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(titleEnglish.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
