import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:falamhymns/screens/sub_screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      'null',
                      isHymns: false,
                    )))
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        margin: EdgeInsets.only(bottom: 0, left: 30, right: 30, top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sawnawkNumber + '. ' + titleFalam,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: primaryText,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    Container(
                      width: 265,
                      child: Text(
                        '     ' + titleEnglish,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: primaryText, height: 1.3),
                      ),
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
