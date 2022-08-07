import 'package:ChristianHlabu/config/app_theme.dart';
import 'package:ChristianHlabu/controllers/bookmark_controller.dart';
import 'package:ChristianHlabu/widgets/hymn_card_widget.dart';
import 'package:ChristianHlabu/widgets/sawnawk_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            icon: SvgPicture.asset(
              iconsPath + "clear.svg",
              color: primaryText,
            ),
          ),
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
                  itemCount: data.hymnsInStorage.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HymnsCardWidget(
                      id: data.hymnsInStorage[index].id!,
                      pageNumber: data.hymnsInStorage[index].pageNumber,
                      title: data.hymnsInStorage[index].title,
                      songNumber: data.hymnsInStorage[index].songNumber,
                      category: data.hymnsInStorage[index].category,
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
