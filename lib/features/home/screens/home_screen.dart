import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/home/widgets/header_section.dart';
import 'package:music_app/features/home/widgets/song_card.dart';
import 'package:music_app/models/playlist_model.dart';

class HomeScreen extends StatefulWidget {
  final Playlist playlist;
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: Dimensions.width20),
          child: const HeaderSection(title: "Trending Music"),
        ),
        SizedBox(height: Dimensions.height20),
        SizedBox(
          height: Dimensions.screenHeight * 0.27,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return SongCard(song: widget.playlist.song![index]);
              }),
        )
      ],
    );
  }
}
