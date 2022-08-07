import 'package:ChristianHlabu/config/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          iconsPath + 'logo-icon.png',
          height: 150,
          width: 150,
        ),
        Center(
          child: Text(
            "Christian Hymns Hlabu",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: primaryText, fontSize: 24),
          ),
        ),
      ],
    );
  }
}
