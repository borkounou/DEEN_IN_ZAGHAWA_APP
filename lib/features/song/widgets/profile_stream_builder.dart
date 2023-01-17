import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/features/song/widgets/song_metadata.dart';

class ProfileStreamBuilder extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const ProfileStreamBuilder({Key? key, required this.audioPlayer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
        stream: audioPlayer.sequenceStateStream,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state?.sequence.isEmpty ?? true) {
            return const SizedBox();
          }
          final metadata = state!.currentSource!.tag as MediaItem;
          return MediaMetadata(
              imageUrl: metadata.artUri.toString(),
              title: metadata.title,
              artist: metadata.artist ?? '');
        });
  }
}
