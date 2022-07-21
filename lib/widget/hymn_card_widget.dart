import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HymnsCardWidget extends HookWidget {
  final int pageNumber;
  final int id;
  final String songNumber;
  final String category;
  final String title;
  bool bookmark;

  HymnsCardWidget({
    required this.id,
    required this.pageNumber,
    required this.songNumber,
    required this.bookmark,
    required this.category,
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
                      category,
                      isHymns: true,
                    )))
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        margin: EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songNumber + '. ' + title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: primaryText,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 17,
              height: 17,
              child:
                  SvgPicture.asset(iconsPath + 'hello.svg', color: primaryText),
            ),
          ],
        ),
      ),
    );
  }
}
