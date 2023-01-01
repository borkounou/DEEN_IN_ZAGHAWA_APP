import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/home/widgets/home_playlist_card.dart';
import 'package:music_app/models/playlist_model.dart';

class HomePlaylist extends StatefulWidget {
  final List<Playlist> playlist;
  final String category;
  const HomePlaylist({Key? key, required this.playlist, this.category = ""})
      : super(key: key);
  static const String routeName = '/HomePlaylist';

  @override
  State<HomePlaylist> createState() => _HomePlaylistState();
}

class _HomePlaylistState extends State<HomePlaylist> {
  @override
  Widget build(BuildContext context) {
    widget.playlist.map((song) => song.author).toSet();
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.width10, right: Dimensions.width10),
          child: BigText(
            text: widget.category,
            size: Dimensions.font20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: Dimensions.height20),
        Expanded(
          child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.playlist.length,
              itemBuilder: ((context, index) {
                if (widget.playlist[index].category == widget.category) {
                  return Center(
                    child: HomePlaylistCard(playlist: widget.playlist),
                  );
                } else if (widget.category == "Recommendé pour vous") {
                  return HomePlaylistCard(playlist: widget.playlist);
                } else {
                  return Container();
                }
              })),
        ),
        SizedBox(height: Dimensions.height20),
      ],
    ));
  }
}
