import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

import '../../../constants/global_variables.dart';
import '../../home/screens/bottom_bar_home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onBoarding';
  OnBoardingScreen({Key? key}) : super(key: key);

  final pages = [
    PageModel(
      color: const Color(0xff106791),
      imageAssetPath: "assets/main_img/askar_4.jpg",
      title: "Quran al Kareem",
      body:
          "Indeed, It is We who send down the Quran and indeed, We will be indeed its Guardian ",
      doAnimateImage: true,
    ),
    PageModel(
      color: const Color(0xff106791),
      imageAssetPath: "assets/main_img/askar_4.jpg",
      title: "Quran al Kareem",
      body:
          "Indeed, It is We who send down the Quran and indeed, We will be indeed its Guardian ",
      doAnimateImage: true,
    ),
    PageModel(
      color: const Color(0xff664d7b),
      imageAssetPath: "assets/main_img/askar_4.jpg",
      title: "Quran al Kareem",
      body:
          "Indeed, It is We who send down the Quran and indeed, We will be indeed its Guardian ",
      doAnimateImage: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.mainGradientColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: OverBoard(
          pages: pages,
          showBullets: true,
          skipCallback: () =>
              Navigator.pushNamed(context, BottomBarHomeScreen.routeName),
          finishCallback: () =>
              Navigator.pushNamed(context, BottomBarHomeScreen.routeName),
        ),
      ),
    );
  }
}
