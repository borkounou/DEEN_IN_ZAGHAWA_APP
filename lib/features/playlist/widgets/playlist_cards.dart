import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/screens/single_song_screen.dart';
import 'package:music_app/models/song_model.dart';

class PlaylistCardS extends StatelessWidget {
  final Song songs;
  const PlaylistCardS({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 7 + Dimensions.height5,
      margin: EdgeInsets.only(bottom: Dimensions.height5 / 2),
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      decoration: BoxDecoration(
          color: Colors.deepPurple.shade800.withOpacity(0.6),
          borderRadius: BorderRadius.circular(Dimensions.radius15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            child: Image.network(
              songs.coverUrl,
              height: Dimensions.height50,
              width: Dimensions.width10 * 5,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Dimensions.width20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  songs.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  songs.author,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SingleSongScreen.routeName,
                  arguments: songs);
            },
            icon: const Icon(
              Icons.play_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
