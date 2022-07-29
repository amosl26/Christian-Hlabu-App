import 'dart:convert';

import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/controller/sort_controller.dart';
import 'package:falamhymns/models/sawnawk_model.dart';
import 'package:falamhymns/widget/sawnawk_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart' as provider;

class SawnawkScreen extends StatefulWidget {
  SawnawkScreen({Key? key}) : super(key: key);

  @override
  State<SawnawkScreen> createState() => _SawnawkScreenState();
}

class _SawnawkScreenState extends State<SawnawkScreen> {
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
      body: provider.Consumer<SortController>(
        builder: (context, data, child) {
          if (data.sawnawkItems.isEmpty) {
            data.readSawnawkJsonData();
            return const Center(child: CircularProgressIndicator());
          }
          if (data.sawnawkItems.isNotEmpty) {
            return ListView.builder(
              itemCount: data.sawnawkItems.length,
              itemBuilder: (context, index) {
                return SawnawkCardWidget(
                  id: data.sawnawkItems[index].id!,
                  pageNumber: data.sawnawkItems[index].pageNumber,
                  titleFalam: data.sawnawkItems[index].titleFalam,
                  bookmark: data.sawnawkItems[index].bookmark,
                  sawnawkNumber: data.sawnawkItems[index].sawnawkNumber,
                  titleEnglish: data.sawnawkItems[index].titleEnglish,
                  isVisible: false,
                );
              },
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
                provider.Provider.of<SortController>(context, listen: false)
                    .sortSawnawkbyAlphabet();
              }),
          SpeedDialChild(
              child: const Icon(Icons.format_list_numbered),
              backgroundColor: Colors.white,
              label: 'Sort by number',
              onTap: () async {
                provider.Provider.of<SortController>(context, listen: false)
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
