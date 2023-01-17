import 'package:flutter/material.dart';

String uri = 'http://192.168.1.32:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(10, 10, 10, 192),
      Color.fromARGB(10, 10, 10, 216),
    ],
    stops: [0.5, 1.0],
  );

  static final mainGradientColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.deepPurple.shade800.withOpacity(0.8),
        Colors.deepPurple.shade200.withOpacity(0.8),
      ]);

  static final metadataGradientColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.deepPurple.shade200,
        Colors.deepPurple.shade800,
      ]);

  // rgb(40, 42, 58)
  static const backgroundColor = Color(0xff0A2647);

  // Color.fromARGB(255, 40, 42, 58); //Color.fromRGBO(40, 42, 58, 0.0);

  static const Color greyBackgroundColor = Color(0xff0A2647);
  static var musicPlayBackground = Colors.cyan[200]!;
  static const unselectedNavBarColor = Color(0xFF526480);
  static const selectedNavBarColor = Colors.white;
  static const accountButtonColor = Color.fromRGBO(32, 38, 71, 10);
}
