import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HymnsCardWidget extends HookWidget {
  final int pageNumber;
  final int id;
  final String songNumber;
  final String title;
  bool bookmark;

  HymnsCardWidget({
    required this.id,
    required this.pageNumber,
    required this.songNumber,
    required this.bookmark,
    required this.title,
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
                      title,
                      bookmark,
                      songNumber,
                      null,
                      isHymns: true,
                    )))
      },
      child: Container(
        height: 90,
        child: Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        songNumber,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
