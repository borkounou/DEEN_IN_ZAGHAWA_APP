import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/features/song/widgets/next_previous_stream_builder.dart';
import 'package:music_app/features/song/widgets/profile_stream_builder.dart';
import 'package:music_app/features/song/widgets/progressbar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';
import '../services/audio_services.dart';
import '../widgets/progress_stream_builder.dart';
import '../widgets/shader_mask_widget.dart';

class MultiSongScreen extends StatefulWidget {
  static const String routeName = '/multiSongScreen';
  final List<Song> song;
  const MultiSongScreen({Key? key, required this.song}) : super(key: key);
  @override
  State<MultiSongScreen> createState() => _MultiSongScreenState();
}

class _MultiSongScreenState extends State<MultiSongScreen> {
  AudioServices audioServices = AudioServices();
  AudioPlayer _audioPlayer = AudioPlayer();
  ConcatenatingAudioSource? _playlistSong;

  void _initAudio() {
    _audioPlayer = audioServices.audioPlayer;
  }

  void _updatePlaylist() {
    _playlistSong = audioServices.updatePlaylist(songs: widget.song);
  }

  Future<void> _init() async {
    await audioServices.init(playlistSong: _playlistSong);
  }

  @override
  void initState() {
    super.initState();
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
          Image.network(widget.song[0].coverUrl, fit: BoxFit.cover),
          const ShaderMaskWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height20 * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileStreamBuilder(audioPlayer: _audioPlayer),
                ProgressStreamBuilder(
                  positionDataStream: audioServices.positionDataStream,
                  audioPlayer: _audioPlayer,
                ),
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
