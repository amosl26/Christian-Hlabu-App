import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/provider_controller.dart';
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
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "Bookmark",
          style: TextStyle(color: primaryText, fontSize: 17),
        ),
        actions: [
          IconButton(
              color: primaryText,
              onPressed: () {},
              icon: Icon(Icons.sort_by_alpha)),
          IconButton(
              color: primaryText,
              onPressed: () {
                provider.Provider.of<SaveDataController>(context, listen: false)
                    .deleteAllData();
              },
              icon: Icon(Icons.clear_all_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: provider.Consumer<SaveDataController>(
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
