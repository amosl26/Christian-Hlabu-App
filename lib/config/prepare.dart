import 'package:falamhymns/config/provider_controller.dart';
import 'package:provider/provider.dart' as provider;
import 'package:falamhymns/config/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/sub_screens/splash_screen.dart';
import 'bottom_bar.dart';

class Prepare extends HookWidget {
  @override
  Widget build(BuildContext context) {
    startSequence() async {
      await Hive.initFlutter();
      await provider.Provider.of<ProviderController>(context, listen: false)
          .getHymnesDataFromStorage();
      await provider.Provider.of<ProviderController>(context, listen: false)
          .getSwanDataFromStorage();
      var box = await Hive.openBox('appBox');

      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomBar()),
          (Route<dynamic> route) => false);
    }

    useEffect(() {
      startSequence();
    }, const []);

    return Scaffold(
      body: Container(
        color: primaryBg,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
