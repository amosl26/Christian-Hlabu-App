import 'package:falamhymns/config/app_theme.dart';
import 'package:falamhymns/config/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import 'config/prepare.dart';
import 'package:falamhymns/config/globals.dart' as globals;

void main() {
  globals.appNavigator = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(provider.MultiProvider(
    providers: [
      provider.ChangeNotifierProvider<ProviderController>(
          create: (_) => ProviderController())
    ],
    child: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: primaryText,
        systemNavigationBarColor: primaryText,
      ));
    }, const []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Circular",
        scaffoldBackgroundColor: primaryBg,
      ),
      home: Prepare(),
    );
  }
}
