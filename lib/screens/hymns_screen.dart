import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controllers/main_controller.dart';
import 'package:falamhymns/widget/hymn_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' as provider;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HymnsScreen extends StatefulWidget {
  HymnsScreen({Key? key}) : super(key: key);

  @override
  State<HymnsScreen> createState() => _HymnsScreenState();
}

class _HymnsScreenState extends State<HymnsScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
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
            onPressed: () {
              provider.Provider.of<MainController>(context, listen: false)
                  .getAllTheNumberForSawan();
            },
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
            data.prepareHymnsForSort();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.hymnItems.isNotEmpty) {
            print(data.numbersExitForHymna);
            return Stack(
              alignment: Alignment.center,
              children: [
                ScrollablePositionedList.builder(
                  itemCount: data.hymnItems.length,
                  itemBuilder: (context, index) {
                    return HymnsCardWidget(
                      id: data.hymnItems[index].id!,
                      pageNumber: data.hymnItems[index].pageNumber,
                      title: data.hymnItems[index].title,
                      songNumber: data.hymnItems[index].songNumber,
                      category: data.hymnItems[index].category,
                      isVisible: false,
                    );
                  },
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                ),
                data.sortTypeHymns == SortTypeForHymns.sortByAlpabet
                    ? Positioned(
                        right: 10,
                        child: SizedBox(
                          height: 300,
                          width: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: data.alphabetsExistForHymna.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  int jumpToThis = data.hymnItems.indexWhere(
                                      (element) => element.title.startsWith(
                                          data.alphabetsExistForHymna[index]));
                                  if (jumpToThis == -1) {
                                    print(
                                        "there is no elemnt start with ${data.alphabets[index]}");
                                    return;
                                  } else {
                                    itemScrollController.jumpTo(
                                        index: jumpToThis);
                                  }
                                },
                                child: SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      data.alphabetsExistForHymna[index],
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Positioned(
                        right: 10,
                        child: SizedBox(
                          height: 300,
                          width: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: data.numbersExitForHymna.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  itemScrollController.jumpTo(
                                      index: data.numbersExitForHymna[index]);
                                },
                                child: SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      data.numbersExitForHymna[index]
                                          .toString(),
                                      style: TextStyle(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
              ],
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
