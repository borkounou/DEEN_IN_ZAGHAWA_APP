import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../constants/dimensions.dart';
import '../../../models/song_model.dart';
import '../../song/widgets/progressbar.dart';

class PlayOrShuffleSwitch extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final List<Song> songs;
  const PlayOrShuffleSwitch(
      {Key? key, required this.audioPlayer, required this.songs})
      : super(key: key);

  @override
  State<PlayOrShuffleSwitch> createState() => PlayOrShuffleSwitchState();
}

class PlayOrShuffleSwitchState extends State<PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50,
      width: Dimensions.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            left: isPlay ? 0 : Dimensions.screenWidth * 0.45,
            child: Container(
              height: Dimensions.height50,
              width: Dimensions.screenWidth * 0.45,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlay = true;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Play",
                            style: TextStyle(
                                color:
                                    isPlay ? Colors.white : Colors.deepPurple,
                                fontSize: Dimensions.font16)),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      Controls(
                        audioPlayer: widget.audioPlayer,
                        iconSize: Dimensions.iconSize24,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlay = false;
                      widget.songs.shuffle();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Shuffle",
                          style: TextStyle(
                              color: isPlay ? Colors.deepPurple : Colors.white,
                              fontSize: Dimensions.font16),
                        ),
                      ),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.deepPurple : Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
