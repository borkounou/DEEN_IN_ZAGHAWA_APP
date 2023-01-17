import 'package:flutter/material.dart';

import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/widgets/profile_stream_builder.dart';
import 'package:music_app/features/song/widgets/progress_stream_builder.dart';
import 'package:music_app/features/song/widgets/progressbar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';

import '../services/audio_services.dart';
import '../widgets/next_previous_stream_builder.dart';
import '../widgets/shader_mask_widget.dart';

class SingleSongScreen extends StatefulWidget {
  final Song song;
  static const String routeName = '/singleSongScreen';
  const SingleSongScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<SingleSongScreen> createState() => _SingleSongScreenState();
}

class _SingleSongScreenState extends State<SingleSongScreen> {
  AudioServices audioServices = AudioServices();
  AudioPlayer _audioPlayer = AudioPlayer();
  List<Song>? uniqueSong;

  void uniqueAudio() {
    uniqueSong = [widget.song];
  }

  ConcatenatingAudioSource? _playlistSong;

  void _initAudio() {
    _audioPlayer = audioServices.audioPlayer;
  }

  void _updatePlaylist() {
    _playlistSong = audioServices.updatePlaylist(songs: uniqueSong!);
  }

  Future<void> _init() async {
    await audioServices.init(playlistSong: _playlistSong);
  }

  @override
  void initState() {
    super.initState();
    uniqueAudio();
    _initAudio();
    _updatePlaylist();
    _audioPlayer.positionStream;
    _audioPlayer.bufferedPositionStream;
    _audioPlayer.durationStream;
    _init();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(widget.song.coverUrl, fit: BoxFit.cover),
          const ShaderMaskWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height20 * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileStreamBuilder(audioPlayer: _audioPlayer),
                SizedBox(
                  height: Dimensions.height10,
                ),
                ProgressStreamBuilder(
                    positionDataStream: audioServices.positionDataStream,
                    audioPlayer: _audioPlayer),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NextOrPrevStreamBuilder(
                      audioPlayer: _audioPlayer,
                      iconSize: Dimensions.height5 * 8,
                      icon: Icons.skip_previous,
                    ),
                    Controls(
                      audioPlayer: _audioPlayer,
                      iconSize: Dimensions.iconSize70,
                    ),
                    NextOrPrevStreamBuilder(
                      audioPlayer: _audioPlayer,
                      iconSize: Dimensions.height5 * 8,
                      icon: Icons.skip_next,
                      check: false,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
