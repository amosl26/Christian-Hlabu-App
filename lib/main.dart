import 'package:ChristianHlabu/controllers/bookmark_controller.dart';
import 'package:ChristianHlabu/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'config/prepare.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(provider.MultiProvider(
    providers: [
      provider.ChangeNotifierProvider<BookmarkController>(
          create: (_) => BookmarkController()),
      provider.ChangeNotifierProvider<MainController>(
          create: (_) => MainController())
    ],
    child: ProviderScope(child: MyApp()),
  ));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
      ));
    }, const []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Circular",
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Circular",
      ),
      home: Prepare(),
    );
  }
}
