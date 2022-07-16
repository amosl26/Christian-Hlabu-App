import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/provider_files.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart' as provider;

import '../screens/about_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/home_screen.dart';
import '../screens/sawnawk_screen.dart';
import '../screens/songs_screen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late PersistentTabController controller;
  late double timeDilation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          iconsPath + "home1.svg",
          color: selectedColor,
        ),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "home1.svg",
          color: unselectedColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(iconsPath + "bible.svg", color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "bible.svg",
          color: unselectedColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(iconsPath + "music2.svg", color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "music2.svg",
          color: unselectedColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon:
            SvgPicture.asset(iconsPath + "bookmark.svg", color: selectedColor),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "bookmark.svg",
          color: unselectedColor,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          iconsPath + "about.svg",
          color: selectedColor,
        ),
        inactiveIcon: SvgPicture.asset(
          iconsPath + "about.svg",
          color: unselectedColor,
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
    provider.Provider.of<ProviderFiles>(context).themeGetter();

    return Scaffold(
      key: _scaffoldKey,
      body: PersistentTabView(
        context,
        controller: controller,
        confineInSafeArea: true,
        backgroundColor:
            provider.Provider.of<ProviderFiles>(context, listen: true)
                    .themeSwitch
                ? Colors.white
                : Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarStyle: NavBarStyle.simple,
        items: _navBarsItems(),
        screens: [
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: HomeScreen()),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SawnawkScreen()),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SongsScreen()),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: FavoriteScreen()),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: AboutScreen()),
        ],
      ),
    );
  }
}
