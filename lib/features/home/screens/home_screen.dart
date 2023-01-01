import 'package:flutter/material.dart';
import 'package:music_app/commons/account_buttons.dart';
import 'package:music_app/commons/animated_button.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/features/home/services/home_services.dart';
import 'package:music_app/features/home/widgets/home_playlist.dart';
import 'package:music_app/models/playlist_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Song> songs = Song.songs;
  HomeServices homeServices = HomeServices();
  List<Playlist>? playlists;
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  PageController pageController =
      PageController(viewportFraction: 0.5, initialPage: 1);
  PageController pageController1 =
      PageController(viewportFraction: 0.5, initialPage: 1);
  PageController pageControllerRamadan =
      PageController(viewportFraction: 1, initialPage: 1);
  PageController pageControllerVieSocial =
      PageController(viewportFraction: 0.5, initialPage: 1);
  PageController pageControllerCHEIK =
      PageController(viewportFraction: 0.5, initialPage: 1);

  var currentPageValue = 0.0;
  final productImg = GlobalVariables.carouselImages;

  fetchProducts() async {
    playlists = await homeServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });

    pageController1.addListener(() {
      setState(() {
        currentPageValue = pageController1.page!;
      });
    });

    fetchProducts();
  }

  @override
  void dispose() {
    pageController.dispose();
    pageController1.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade800.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8),
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: playlists == null
              ? const Loader()
              : SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.width10,
                                right: Dimensions.width10),
                            child: BigText(
                              text: "Salaam",
                              color: Colors.white,
                              size: Dimensions.font26,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width10,
                                  vertical: Dimensions.height5),
                              height: Dimensions.height50 - Dimensions.height10,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: GlobalVariables.accountButtonColor,
                                    width: 0.0),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height50),
                                color: GlobalVariables.accountButtonColor,
                              ),
                              child: const AnimatedButton()),
                        ],
                      ),
                      Row(
                        children: [
                          AccountButton(
                            text: "Music",
                            ontTap: () {},
                            color: GlobalVariables.accountButtonColor,
                          ),
                          AccountButton(
                            text: "PodCast et shows",
                            ontTap: () {},
                            color: GlobalVariables.accountButtonColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: BigText(
                          text: "Recemment consulté",
                          color: Colors.white,
                          size: Dimensions.font16,
                        ),
                      ),
                      SizedBox(
                          height: Dimensions.height50 * 5,
                          child: HomePlaylist(
                            playlist: playlists!,
                            category: "Recommendé pour vous",
                          )),
                      SizedBox(
                          height: Dimensions.height50 * 5,
                          child: HomePlaylist(
                            playlist: playlists!,
                            category: "Ramadan",
                          )),
                      SizedBox(
                          height: Dimensions.height50 * 5,
                          child: HomePlaylist(
                            playlist: playlists!,
                            category: "Sakaat",
                          )),
                      SizedBox(
                          height: Dimensions.height50 * 5,
                          child: HomePlaylist(
                            playlist: playlists!,
                            category: "Mariage",
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
