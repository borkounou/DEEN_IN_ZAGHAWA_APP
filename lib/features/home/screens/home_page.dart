import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/home/services/home_services.dart';
import 'package:music_app/features/home/widgets/app_tabs.dart';
import 'package:music_app/features/home/widgets/tab_var_contents.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/models/song_model.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/homePage';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;

  HomeServices homeServices = HomeServices();
  List<Playlist> playlists = [];
  Map<String, Color> appTabColor = {
    "Ramadan": Colors.orangeAccent,
    "Sakaat": Colors.redAccent.withOpacity(0.6),
    "Salaat": Colors.blueAccent.withOpacity(0.6),
  };

  @override
  void initState() {
    super.initState();

    if (playlists.isEmpty) {
      _tabController = TabController(length: 3, vsync: this);
    } else {
      _tabController = TabController(length: playlists.length, vsync: this);
    }

    _scrollController = ScrollController();
    fetchProducts();
    // readData();
  }

  fetchProducts() async {
    playlists = await homeServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return playlists.isEmpty
        ? const Loader()
        : Container(
            margin: EdgeInsets.only(top: Dimensions.height10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.deepPurple.shade800.withOpacity(0.8),
                  Colors.deepPurple.shade200.withOpacity(0.8),
                ])),
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageIcon(
                            const AssetImage(
                              "assets/main_img/menu_icon.png",
                            ),
                            color: Colors.black,
                            size: Dimensions.iconSize24 - 1),
                        Row(
                          children: [
                            const Icon(Icons.search),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            const Icon(Icons.notifications)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Text("Popular Books",
                            style: TextStyle(
                              fontSize: Dimensions.height10 * 2.2,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    height: Dimensions.height10 * 15.7,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: -Dimensions.width5 * 5,
                            right: 0,
                            child: Container(
                              height: Dimensions.height10 * 15.7,
                              child: PageView.builder(
                                  controller:
                                      PageController(viewportFraction: 0.8),
                                  itemCount: 5,
                                  // popularBooks.isEmpty ? 0 : popularBooks.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: Dimensions.height10 * 15.7,
                                      margin: EdgeInsets.only(
                                          right: Dimensions.width10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/main_img/askar_1.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    );
                                  }),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: NestedScrollView(
                          controller: _scrollController,
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            List<AppTabs> tabs = playlists
                                .map((playlist) => AppTabs(
                                    text: playlist.category,
                                    color: appTabColor[playlist.category]!))
                                .toList();

                            return [
                              SliverAppBar(
                                backgroundColor: Colors.transparent,
                                pinned: true,
                                bottom: PreferredSize(
                                  preferredSize: Size.fromHeight(
                                      Dimensions.height50 -
                                          Dimensions.height10),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: Dimensions.height20,
                                        left: Dimensions.width15),
                                    child: TabBar(
                                      indicatorPadding: const EdgeInsets.all(0),
                                      indicatorSize: TabBarIndicatorSize.label,
                                      labelPadding: EdgeInsets.only(
                                          right: Dimensions.width10),
                                      controller: _tabController,
                                      indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.height10),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                blurRadius:
                                                    Dimensions.height10 - 3,
                                                offset: const Offset(0, 0))
                                          ]),
                                      isScrollable: true,
                                      tabs: tabs,
                                    ),
                                  ),
                                ),
                              )
                            ];
                          },
                          body: TabBarView(
                              controller: _tabController,
                              children: playlists.map((playlist) {
                                return TabVarViewContents(
                                  song: playlist.song!,
                                );
                              }).toList())))
                ],
              ),
            )),
          );
  }
}
