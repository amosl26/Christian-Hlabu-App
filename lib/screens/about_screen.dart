import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryBg,
          centerTitle: false,
          title: Text(
            "About",
            style: TextStyle(
                color: primaryText, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: primaryText),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Text('About Screen'),
        ));
  }
}
