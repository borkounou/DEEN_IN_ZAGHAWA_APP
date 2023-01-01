import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/admin/screens/add_song_page.dart';
import 'package:music_app/features/playlist/widgets/playlist_cards.dart';
import 'package:music_app/features/song/screens/song_screen.dart';
import 'package:music_app/models/playlist_model.dart';

class AdminPlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const AdminPlaylistScreen({Key? key, required this.playlist})
      : super(key: key);
  static const String routeName = '/adminPlaylistScreen';

  @override
  State<AdminPlaylistScreen> createState() => _AdminPlaylistScreenState();
}

class _AdminPlaylistScreenState extends State<AdminPlaylistScreen> {
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
              expandedHeight: 300,
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
                    Navigator.pushNamed(context, SongScreen.routeName,
                        arguments: widget.playlist.song![index]);
                  },
                  child: ListTile(
                    title: PlaylistCard(
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purpleAccent,
          tooltip: "Add a products",
          onPressed: () {
            Navigator.pushNamed(context, AddSongScreen.routeName,
                arguments: widget.playlist);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
