import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/constants/dimensions.dart';

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
  const PositionData(this.position, this.bufferedPosition, this.duration);
}

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final double iconSize;
  const Controls({Key? key, required this.audioPlayer, required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              width: Dimensions.width20 * 3,
              height: Dimensions.height20 * 3,
              margin: EdgeInsets.all(Dimensions.height10),
              child: const Loader(),
            );
          } else if (!(playing ?? false)) {
            return IconButton(
              onPressed: audioPlayer.play,
              iconSize: iconSize,
              icon: const Icon(
                Icons.play_circle,
                color: Colors.white,
              ),
            );
          } else if (processingState != ProcessingState.completed) {
            return IconButton(
              onPressed: audioPlayer.pause,
              iconSize: iconSize,
              icon: const Icon(
                Icons.pause_circle,
                color: Colors.white,
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                audioPlayer.seek(Duration.zero,
                    index: audioPlayer.effectiveIndices!.first);
              },
              iconSize: iconSize,
              icon: const Icon(
                Icons.replay_circle_filled_outlined,
                color: Colors.white,
              ),
            );
          }
        } else {
          return const Loader();
        }
      },
    );
  }
}
