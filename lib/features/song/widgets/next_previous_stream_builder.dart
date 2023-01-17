import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class NextOrPrevStreamBuilder extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final double iconSize;
  final IconData icon;
  final bool check;
  const NextOrPrevStreamBuilder({
    Key? key,
    required this.audioPlayer,
    required this.iconSize,
    required this.icon,
    this.check = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
        stream: audioPlayer.sequenceStateStream,
        builder: (context, snapshot) {
          return check
              ? IconButton(
                  iconSize: iconSize,
                  // Dimensions.height5 * 9,
                  onPressed: audioPlayer.hasPrevious
                      ? audioPlayer.seekToPrevious
                      : null,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  ))
              : IconButton(
                  iconSize: iconSize,
                  onPressed:
                      audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  ));
        });
  }
}
