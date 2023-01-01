import 'package:flutter/material.dart';

String uri = '';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(10, 10, 10, 192),
      Color.fromARGB(10, 10, 10, 216),
    ],
    stops: [0.5, 1.0],
  );
  // rgb(40, 42, 58)
  static const backgroundColor = Color(0xff0A2647);
  // Color.fromARGB(255, 40, 42, 58); //Color.fromRGBO(40, 42, 58, 0.0);

  static const Color greyBackgroundColor = Color(0xff0A2647);
  static var musicPlayBackground = Colors.cyan[200]!;
  static const unselectedNavBarColor = Color(0xFF526480);
  static const selectedNavBarColor = Colors.white;
  static const accountButtonColor = Color.fromRGBO(32, 38, 71, 10);
  // rgb(32, 82, 149)

  // STATIC IMAGES
  static const List<String> carouselImages = [
    './assets/main_img/askar_1.jpg',
    './assets/main_img/askar_2.jpg',
    './assets/main_img/askar_3.jpg',
    './assets/main_img/askar_4.jpg',
    './assets/main_img/askar_5.jpg',
    './assets/main_img/askar_6.jpg',
    './assets/main_img/askar_7.jpg',
    './assets/main_img/askar_8.jpg',
    './assets/main_img/askar_9.jpg',
    './assets/main_img/askar_10.jpg',
    './assets/main_img/askar_6.jpg',
    './assets/main_img/music_bg.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
