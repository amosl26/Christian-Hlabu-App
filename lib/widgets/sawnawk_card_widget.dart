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

  bool isVisible;

  SawnawkCardWidget(
      {required this.id,
      required this.pageNumber,
      required this.sawnawkNumber,
      required this.titleFalam,
      required this.titleEnglish,
      required this.isVisible});

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
                
                      sawnawkNumber,
                      SawnAwkModel(
                        id,
                        pageNumber,
                        sawnawkNumber,
                        titleFalam,
                        titleEnglish,
                      ),
                      'null',
                      isHymns: false,
                    )))
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: EdgeInsets.only(bottom: 0, left: 5, right: 10, top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(5, 5),
                        blurRadius: 1,
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(5, 5),
                          blurRadius: 15,
                          spreadRadius: 1)
                    ]),
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  iconsPath + 'bible.svg',
                  color: primaryText,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
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
          ],
        ),
      ),
    );
  }
}
