import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';

import 'package:music_app/features/playlist/widgets/playlist_cards.dart';
import 'package:music_app/features/song/screens/single_song_screen.dart';
import 'package:music_app/models/playlist_model.dart';

class SearchPlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const SearchPlaylistScreen({Key? key, required this.playlist})
      : super(key: key);
  static const String routeName = '/searchPlaylistScreen';

  @override
  State<SearchPlaylistScreen> createState() => _SearchPlaylistScreenState();
}

class _SearchPlaylistScreenState extends State<SearchPlaylistScreen> {
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
              backgroundColor: Colors.transparent,
              pinned: true,
              expandedHeight: Dimensions.height30 * 10,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.playlist.imageUrl,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              if (widget.playlist.song?[index].category ==
                  widget.playlist.category) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SingleSongScreen.routeName,
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
