import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/song/widgets/progressbar.dart';

import '../../../constants/dimensions.dart';

class ProgressStreamBuilder extends StatelessWidget {
  final Stream<PositionData> positionDataStream;
  final AudioPlayer audioPlayer;

  const ProgressStreamBuilder(
      {Key? key, required this.positionDataStream, required this.audioPlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
        stream: positionDataStream,
        builder: (context, snapshot) {
          final positionData = snapshot.data;
          return Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            child: ProgressBar(
                barHeight: 8,
                baseBarColor: Colors.grey[600],
                bufferedBarColor: Colors.grey,
                progressBarColor: Colors.redAccent,
                thumbColor: Colors.redAccent,
                timeLabelTextStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
                onSeek: audioPlayer.seek,
                progress: positionData?.position ?? Duration.zero,
                buffered: positionData?.bufferedPosition ?? Duration.zero,
                total: positionData?.duration ?? Duration.zero),
          );
        });
  }
}
