import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/screens/single_song_screen.dart';
import 'package:music_app/models/song_model.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SingleSongScreen.routeName,
            arguments: song);
      },
      child: Container(
        margin: EdgeInsets.only(right: Dimensions.height10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: Dimensions.screenWidth * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  image: DecorationImage(
                    image: NetworkImage(song.coverUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: Dimensions.height50,
              width: Dimensions.screenWidth * 0.37,
              margin: EdgeInsets.only(bottom: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
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
                        song.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        song.category,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
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
        ),
      ),
    );
  }
}
