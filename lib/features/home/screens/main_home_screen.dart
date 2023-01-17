import 'package:flutter/material.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/home/screens/home_screen.dart';
import 'package:music_app/features/home/services/home_services.dart';
import 'package:music_app/features/home/widgets/custom_app_bar.dart';
import 'package:music_app/features/home/widgets/discover_music.dart';
import 'package:music_app/features/home/widgets/header_section.dart';
import 'package:music_app/features/home/widgets/playlist_card.dart';
import 'package:music_app/models/playlist_model.dart';
import '../../../constants/global_variables.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/main-home-page';
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  HomeServices homeServices = HomeServices();
  List<Playlist>? playlists;

  fetchProducts() async {
    playlists = await homeServices.fetchProducts(context: context);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.mainGradientColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // drawer: Drawer(
          //   backgroundColor: Colors.deepPurple.shade300,
          //   child: Column(
          //     children: [
          //       Switch(
          //           value: themeChange.darkTheme,
          //           onChanged: (value) {
          //             themeChange.darkTheme = value;
          //           })
          //     ],
          //   ),
          // ),
          appBar: const CustomAppBar(),
          body: playlists == null
              ? const Loader()
              : SingleChildScrollView(
                  // physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const DiscoverMusic(),
                      Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width20,
                              top: Dimensions.height20,
                              bottom: Dimensions.height20),
                          child: HomeScreen(
                            playlist: playlists![0],
                          )),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.height20),
                        child: Column(
                          children: [
                            const HeaderSection(title: "Playlists"),
                            ListView.builder(
                              padding:
                                  EdgeInsets.only(top: Dimensions.height20),
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: playlists!.length,
                              itemBuilder: (context, index) {
                                return PlaylistCard(
                                  playlist: playlists![index],
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
