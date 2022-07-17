import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "About",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        body: Center(
          child: Text('About Screen'),
        ));
  }
}
