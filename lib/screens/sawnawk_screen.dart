import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controllers/main_controller.dart';
import 'package:falamhymns/widgets/sawnawk_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' as provider;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SawnawkScreen extends StatefulWidget {
  SawnawkScreen({Key? key}) : super(key: key);

  @override
  State<SawnawkScreen> createState() => _SawnawkScreenState();
}

class _SawnawkScreenState extends State<SawnawkScreen> {
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
        title: const Text(
          "Sawnawk Bible",
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
          if (data.sawnawkItems.isEmpty) {
            data.getThingReadyForTheSawna();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.sawnawkItems.isNotEmpty) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ScrollablePositionedList.builder(
                  itemCount: data.sawnawkItems.length,
                  itemBuilder: (context, index) {
                    return SawnawkCardWidget(
                      id: data.sawnawkItems[index].id!,
                      pageNumber: data.sawnawkItems[index].pageNumber,
                      titleFalam: data.sawnawkItems[index].titleFalam,
                      sawnawkNumber: data.sawnawkItems[index].sawnawkNumber,
                      titleEnglish: data.sawnawkItems[index].titleEnglish,
                      isVisible: false,
                    );
                  },
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                ),
                data.sortTypeSawna == SortTypeForSawna.sortByAlpabet
                    ? Positioned(
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(5),
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
                          child: SizedBox(
                            height: 300,
                            width: 50,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: data.alphabetsExistForSawnawk.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    int jumpToThis = data.sawnawkItems
                                        .indexWhere((element) =>
                                            element.titleFalam.startsWith(
                                                data.alphabetsExistForSawnawk[
                                                    index]));
                                    itemScrollController.jumpTo(
                                        index: jumpToThis);
                                  },
                                  child: Container(
                                    child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          data.alphabetsExistForSawnawk[index],
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(5),
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
                          child: SizedBox(
                            width: 50,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: data.numbersExitForSawna.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    itemScrollController.jumpTo(
                                        index: data.numbersExitForSawna[index]);
                                  },
                                  child: SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: Text(
                                        (data.numbersExitForSawna[index] + 1)
                                            .toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            );
          }
          return const Center(
              child: Text("Error Happend Try Refresh The Page"));
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
                    .sortSawnawkbyAlphabet();
              }),
          SpeedDialChild(
              child: const Icon(Icons.format_list_numbered),
              backgroundColor: Colors.white,
              label: 'Sort by number',
              onTap: () async {
                provider.Provider.of<MainController>(context, listen: false)
                    .sortSawnawkByNumbers();
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
