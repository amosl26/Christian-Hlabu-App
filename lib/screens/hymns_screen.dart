import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controllers/main_controller.dart';
import 'package:falamhymns/widget/hymn_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' as provider;

class HymnsScreen extends StatefulWidget {
  HymnsScreen({Key? key}) : super(key: key);

  @override
  State<HymnsScreen> createState() => _HymnsScreenState();
}

class _HymnsScreenState extends State<HymnsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBg,
        centerTitle: false,
        title: Text(
          "All Hymns",
          style: TextStyle(
              color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            color: primaryText,
            onPressed: () {},
            icon: SvgPicture.asset(
              iconsPath + "search.svg",
              color: primaryText,
            ),
          ),
        ],
      ),
      body: provider.Consumer<MainController>(
        builder: (context, data, child) {
          if (data.hymnItems.isEmpty) {
            data.getHymnJsonData();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.hymnItems.isNotEmpty) {
            return ListView.builder(
              itemCount: data.hymnItems.length,
              itemBuilder: (context, index) {
                return HymnsCardWidget(
                  id: data.hymnItems[index].id!,
                  pageNumber: data.hymnItems[index].pageNumber,
                  title: data.hymnItems[index].title,
                  bookmark: data.hymnItems[index].bookmark,
                  songNumber: data.hymnItems[index].songNumber,
                  category: data.hymnItems[index].category,
                  isVisible: false,
                );
              },
            );
          }
          return const Center(child: Text("Error, Try refresh the screen"));
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
              child: const Icon(Icons.sort_by_alpha_outlined),
              backgroundColor: Colors.white,
              label: 'Sort by alphabet',
              onTap: () async {
                provider.Provider.of<MainController>(context, listen: false)
                    .sortHymnbyAlphabet();
              }),
          SpeedDialChild(
              child: const Icon(Icons.format_list_numbered),
              backgroundColor: Colors.white,
              label: 'Sort by number',
              onTap: () async {
                provider.Provider.of<MainController>(context, listen: false)
                    .sortHymnByNumbers();
              }),
          SpeedDialChild(
            child: SvgPicture.asset(
              iconsPath + "search.svg",
              color: primaryText,
            ),
            label: 'Search by number or title',
            backgroundColor: Colors.white,
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
    );
  }
}
