import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/playlist/screens/main_playlist_screen.dart';

import 'package:music_app/models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;
  static const String routeName = '/playlistCard';
  const PlaylistCard({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MainPlaylistScreen.routeName,
            arguments: playlist);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.height10),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade800.withOpacity(0.6),
            borderRadius: BorderRadius.circular(Dimensions.radius15)),
        height: Dimensions.height15 * 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              child: Image.network(
                playlist.imageUrl,
                height: Dimensions.height50,
                width: Dimensions.width10 * 5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${playlist.song!.length} songs",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
