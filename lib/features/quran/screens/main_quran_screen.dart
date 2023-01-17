import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/features/home/widgets/app_tabs.dart';
import 'package:music_app/features/home/widgets/tab_var_contents.dart';
import 'package:music_app/features/search/services/quran_services.dart';
import 'package:music_app/features/search/widgets/search_box.dart';

import 'package:music_app/models/quran_surah_model.dart';

import '../../../commons/common_text.dart';

class MainQuranScreen extends StatefulWidget {
  static const String routeName = '/mainQuranScreen';
  const MainQuranScreen({Key? key}) : super(key: key);

  @override
  State<MainQuranScreen> createState() => _MainQuranScreenState();
}

class _MainQuranScreenState extends State<MainQuranScreen>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? _tabController;

  QuranServices quranServices = QuranServices();
  List<Surahs> surahs = [];
  fetchProducts() async {
    surahs = await quranServices.fetchSurahs(
        model: "quran-uthmani", context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    fetchProducts();
    // readData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height10),
      decoration: BoxDecoration(gradient: GlobalVariables.mainGradientColor),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(height: Dimensions.height20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  child: CommonText(
                    text: "Noble Coran",
                    fontSize: Dimensions.font26,
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height20),
            SearchBox(size: Dimensions.height10 / 3),
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
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              height: Dimensions.height10 * 15.7,
                              margin:
                                  EdgeInsets.only(right: Dimensions.width10),
                              padding: EdgeInsets.only(
                                  left: Dimensions.width10,
                                  top: Dimensions.height10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius15),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/main_img/askar_1.jpg"),
                                    fit: BoxFit.fill),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                      text: "Al-Faatiha",
                                      fontSize: Dimensions.font20),
                                  SizedBox(height: Dimensions.height10 / 2),
                                  CommonText(
                                      text: "2:5", fontSize: Dimensions.font20),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  CommonText(
                                      text: "Derniere lecture",
                                      fontSize: Dimensions.font12),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(
                            Dimensions.height50 - Dimensions.height10),
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: Dimensions.height20,
                              left: Dimensions.width15),
                          child: TabBar(
                            indicatorPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding:
                                EdgeInsets.only(right: Dimensions.width10),
                            controller: _tabController,
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.height10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: Dimensions.height10 - 3,
                                      offset: const Offset(0, 0))
                                ]),
                            isScrollable: true,
                            tabs: const [
                              AppTabs(text: "Sura", color: Colors.deepPurple),
                              AppTabs(text: "Juzz", color: Colors.deepPurple),
                              AppTabs(
                                  text: "Playlists", color: Colors.deepPurple),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  TabVarViewContents(surahs: surahs),
                  TabVarViewContents(surahs: surahs),
                  TabVarViewContents(surahs: surahs),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
