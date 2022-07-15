import 'package:falamhymns/main_screens/about_screen.dart';
import 'package:falamhymns/main_screens/favorite_screen.dart';
import 'package:falamhymns/main_screens/home_screen.dart';
import 'package:falamhymns/main_screens/sawnawk_screen.dart';
import 'package:falamhymns/main_screens/songs_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Falam Hymns Hlabu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Falam Hymns Hlabu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final screens = [
    HomeScreen(),
    SawnawkScreen(),
    SongsScreen(),
    FavoriteScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Sawnawk',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note),
                label: 'Songs',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
                backgroundColor: Colors.blue),
          ]),
    );
  }
}
