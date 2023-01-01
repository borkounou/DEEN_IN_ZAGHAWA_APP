import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/commons/smallText.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/admin/screens/add_song_page.dart';
import 'package:music_app/features/admin/screens/adminPlaylistScreen.dart';
import 'package:music_app/features/home/services/home_services.dart';
import 'package:music_app/features/search/widgets/search_box.dart';
import 'package:music_app/models/playlist_model.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  HomeServices homeServices = HomeServices();
  List<Playlist>? playlists;
  final List<Color> color = [
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.black45,
    Colors.brown,
    Colors.orangeAccent,
    Colors.black87,
    Colors.greenAccent,
    Colors.black45,
    Colors.brown,
    Colors.orangeAccent,
    Colors.black87,
  ];

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
    return Container(
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
        body: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height5 * 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width10),
                  child: BigText(
                    text: "Chercher",
                    color: Colors.white,
                    size: Dimensions.font26,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                const SearchBox(),
                SizedBox(
                  height: Dimensions.height15,
                ),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width10),
                  child: SmallText(
                    text: "Toutes les categories",
                    size: Dimensions.font16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: playlists?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return playlists == null
                            ? const Loader()
                            : GestureDetector(
                                onTap: () {
                                  if (playlists![index].song == null) {
                                    Navigator.pushNamed(
                                        context, AddSongScreen.routeName,
                                        arguments: playlists![index]);
                                  } else {
                                    Navigator.pushNamed(
                                        context, AdminPlaylistScreen.routeName,
                                        arguments: playlists![index]);
                                  }
                                },
                                child: Card(
                                    elevation: 5,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.transparent,
                                    child: Container(
                                      width: Dimensions.width10 * 18,
                                      height: Dimensions.height10 * 9,
                                      color: color[index],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              SmallText(
                                                text:
                                                    playlists![index].category,
                                                color: Colors.white,
                                                size: Dimensions.font20,
                                              ),
                                            ],
                                          ),
                                          Transform.rotate(
                                            angle: 0.3,
                                            child: Image(
                                              width: Dimensions.width10 * 7,
                                              height: Dimensions.height10 * 8,
                                              image: NetworkImage(
                                                playlists![index].imageUrl,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
