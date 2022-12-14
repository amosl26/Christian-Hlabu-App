import 'package:ChristianHlabu/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../screens/bookmark_screen.dart';
import '../screens/home_screen.dart';
import '../screens/sawnawk_screen.dart';
import '../screens/hymns_screen.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late PersistentTabController controller;
  late double timeDilation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          iconsPath + "home.svg",
          color: selectedColor,
          height: 28,
        ),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "home.svg",
          color: unselectedColor,
          height: 28,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(iconsPath + "music.svg", color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "music.svg",
          color: unselectedColor,
          height: 25,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(iconsPath + "bible.svg",
            height: 23, color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "bible.svg",
          color: unselectedColor,
          height: 23,
        ),
      ),
      PersistentBottomNavBarItem(
        icon:
            SvgPicture.asset(iconsPath + "bookmark.svg", color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "bookmark.svg",
          color: unselectedColor,
          height: 25,
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: PersistentTabView(
        context,
        controller: controller,
        confineInSafeArea: true,
        backgroundColor: primaryBg,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.style3,
        items: _navBarsItems(),
        screens: [
          Container(
              height: MediaQuery.of(context).size.height, child: HomeScreen()),
          Container(
              height: MediaQuery.of(context).size.height, child: HymnsScreen()),
          Container(
              height: MediaQuery.of(context).size.height,
              child: SawnawkScreen()),
          Container(
              height: MediaQuery.of(context).size.height,
              child: BookmarkScreen()),
        ],
      ),
    );
  }
}
