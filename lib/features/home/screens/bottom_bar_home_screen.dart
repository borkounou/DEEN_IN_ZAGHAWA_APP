import 'package:flutter/material.dart';
import '../../../constants/global_variables.dart';
import '../../quran/screens/main_quran_screen.dart';
import '../../quran/screens/surate_detail_screen.dart';
import '../../onboarding/screens/onboarding_screen.dart';
import 'package:music_app/features/home/screens/main_home_screen.dart';
import 'package:music_app/features/search/screens/categories_search.dart';
import 'package:music_app/features/home/widgets/custom_bottom_nav_bar.dart';


class BottomBarHomeScreen extends StatefulWidget {
  static const String routeName = '/bottom-home';
  const BottomBarHomeScreen({super.key});

  @override
  State<BottomBarHomeScreen> createState() => _BottomBarHomeScreenState();
}

class _BottomBarHomeScreenState extends State<BottomBarHomeScreen> {
  int _page = 0;
  List<Widget> pages = [
    const MainHomeScreen(),
    const CategoriesSearch(),
    // OnBoardingScreen(),
    const MainQuranScreen(),
    // const SurahDetailBodyView()
    const Center(child: Text("Center data")),

    // const AddPlaylistScreen()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.mainGradientColor),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CustomNavigationBar(
            updatePage: updatePage,
            page: _page,
          ),
          body: pages[_page]),
    );
  }
}
