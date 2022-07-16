import 'package:falamhymns/config/app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final double size;
  final String color;
  const SplashScreen(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Christian Hymns Hlabu",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color == "dark" ? Colors.white : Colors.black,
              fontSize: size),
        ),
        Text(
          ".",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: size, color: colorPrimary),
        ),
      ],
    );
  }
}
