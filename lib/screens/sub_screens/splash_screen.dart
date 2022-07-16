import 'package:falamhymns/config/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Christian Hymns Hlabu",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: primaryText, fontSize: 24),
        ),
      ],
    );
  }
}
