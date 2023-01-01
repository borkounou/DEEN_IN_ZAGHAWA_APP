import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/admin/screens/add_song_page.dart';
import 'package:music_app/features/playlist/screens/playlist_screen.dart';
import 'package:music_app/models/playlist_model.dart';

class HomePlaylistCard extends StatelessWidget {
  final List<Playlist> playlist;

  const HomePlaylistCard({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Playlist pls =
        playlist.where((music) => music.author == "Ramadan") as Playlist;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (pls.song == null) {
              Navigator.pushNamed(context, AddSongScreen.routeName,
                  arguments: playlist);
            } else {
              Navigator.pushNamed(context, PlaylistScreen.routeName,
                  arguments: playlist);
            }
          },
          child: Container(
            margin: EdgeInsets.all(Dimensions.height5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              child: Image.network(
                pls.imageUrl,
                height: Dimensions.height50 * 7,
                width: Dimensions.width10 * 40,
                // width: Dimensions.screenWidth - Dimensions.width20,

                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: Dimensions.height50 * 2,
            left: Dimensions.width10 * 3,
          ),
          height: Dimensions.height50,
          width: Dimensions.containerWidth150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height15),
            color: Colors.white.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pls.category,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    pls.author,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(
                Icons.play_circle,
                color: Colors.deepPurple,
              )
            ],
          ),
        ),
      ],
    );
  }
}
