import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:falamhymns/components/provider_files.dart';
import 'package:falamhymns/screens/about.dart';
import 'package:falamhymns/screens/favorite.dart';
import 'package:falamhymns/screens/home.dart';
import 'package:falamhymns/screens/songs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderFiles>(builder: ((context, value, child) {
      return Scaffold(
        extendBody: true,
        body: navigation.elementAt(_pageIndex),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            backgroundColor:
                provider.Provider.of<ProviderFiles>(context, listen: true)
                        .themeSwitch
                    ? Colors.white
                    : Color.fromRGBO(33, 33, 33, 1.0),
            margin: EdgeInsets.only(left: 10, right: 10),
            currentIndex: _pageIndex,
            dotIndicatorColor:
                provider.Provider.of<ProviderFiles>(context, listen: true)
                        .themeSwitch
                    ? Color(0xFF320452)
                    : Colors.lightBlue,

            unselectedItemColor:
                provider.Provider.of<ProviderFiles>(context, listen: true)
                        .themeSwitch
                    ? Colors.black
                    : Colors.white,
            // enableFloatingNavBar: false,
            onTap: (int index) {
              setState(() {
                _pageIndex = index;
              });
            },
            items: [
              /// Home
              DotNavigationBarItem(
                icon: Icon(Icons.home),
                selectedColor:
                    provider.Provider.of<ProviderFiles>(context, listen: true)
                            .themeSwitch
                        ? Color(0xFF320452)
                        : Colors.lightBlue,
              ),
              DotNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                selectedColor:
                    provider.Provider.of<ProviderFiles>(context, listen: true)
                            .themeSwitch
                        ? Color(0xFF320452)
                        : Colors.lightBlue,
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                selectedColor:
                    provider.Provider.of<ProviderFiles>(context, listen: true)
                            .themeSwitch
                        ? Color(0xFF320452)
                        : Colors.lightBlue,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                selectedColor:
                    provider.Provider.of<ProviderFiles>(context, listen: true)
                            .themeSwitch
                        ? Color(0xFF320452)
                        : Colors.lightBlue,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(Icons.question_answer_outlined),
                selectedColor:
                    provider.Provider.of<ProviderFiles>(context, listen: true)
                            .themeSwitch
                        ? Color(0xFF320452)
                        : Colors.lightBlue,
              ),
            ],
          ),
        ),
      );
    }));
  }
}

final List<Widget> navigation = [
  Home(),
  Favorite(),
  Songs(),
  About(),
];
