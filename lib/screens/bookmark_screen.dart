import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controller/bookmark_controller.dart';
import 'package:falamhymns/widget/hymn_card_widget.dart';
import 'package:falamhymns/widget/sawnawk_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart' as provider;

class BookmarkScreen extends HookWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "Bookmark",
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              color: primaryText,
              onPressed: () {
                provider.Provider.of<BookmarkController>(context, listen: false)
                    .deleteAllData();
              },
              icon: Icon(Icons.clear_all_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: provider.Consumer<BookmarkController>(
          builder: (context, data, child) {
            return Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.HymnsInStorage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HymnsCardWidget(
                      id: data.HymnsInStorage[index].id!,
                      pageNumber: data.HymnsInStorage[index].pageNumber,
                      title: data.HymnsInStorage[index].title,
                      bookmark: data.HymnsInStorage[index].bookmark,
                      songNumber: data.HymnsInStorage[index].songNumber,
                      category: data.HymnsInStorage[index].category,
                      isVisible: true,
                    );
                  },
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.SawnInStorage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SawnawkCardWidget(
                      id: data.SawnInStorage[index].id!,
                      pageNumber: data.SawnInStorage[index].pageNumber,
                      titleFalam: data.SawnInStorage[index].titleFalam,
                      bookmark: data.SawnInStorage[index].bookmark,
                      sawnawkNumber: data.SawnInStorage[index].sawnawkNumber,
                      titleEnglish: data.SawnInStorage[index].titleEnglish,
                      isVisible: true,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
