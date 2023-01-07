import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/features/playlist/widgets/playlist_cards.dart';
import 'package:music_app/features/song/screens/single_song_screen.dart';
import 'package:music_app/models/playlist_model.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);
  static const String routeName = '/playlistScreen';

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.mainGradientColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height10 * 2,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.clear,
                      size: Dimensions.iconSize16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white,
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    top: Dimensions.height5,
                    bottom: Dimensions.height10,
                  ),
                  child: Center(
                    child: BigText(
                      text: widget.playlist.title,
                      size: Dimensions.font16,
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              pinned: true,
              expandedHeight: Dimensions.height30 * 100,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.playlist.imageUrl,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widget.playlist.song == []
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SingleSongScreen.routeName,
                            arguments: widget.playlist.song![index]);
                      },
                      child: ListTile(
                          title: Container(
                        color: Colors.orangeAccent,
                        height: Dimensions.height50,
                        width: Dimensions.height50,
                      )),
                    );
                  }, childCount: 5))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                    if (widget.playlist.song?[index].category ==
                            widget.playlist.category &&
                        widget.playlist.song != []) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, SingleSongScreen.routeName,
                              arguments: widget.playlist.song![index]);
                        },
                        child: ListTile(
                          title: PlaylistCardS(
                            songs: widget.playlist.song![index],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }, childCount: widget.playlist.song?.length))
          ],
        ),
      ),
    );
  }
}
