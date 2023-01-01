import 'package:flutter/material.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/widgets/seekbar.dart';
import 'package:music_app/models/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class SongScreen extends StatefulWidget {
  final Song song;
  static const String routeName = '/songScreen';
  const SongScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(Uri.parse(widget.song.url)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBardData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBardData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBardData(position, duration ?? Duration.zero);
      });
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
          Image.network(
            widget.song.coverUrl,
            fit: BoxFit.cover,
          ),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: const [
                    0.0,
                    0.4,
                    0.6
                  ]).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.deepPurple.shade200,
                    Colors.deepPurple.shade800,
                  ])),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20,
              vertical: Dimensions.height20 * 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<SeekBardData>(
                    stream: _seekBarDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        position: positionData?.position ?? Duration.zero,
                        duration: positionData?.duration ?? Duration.zero,
                        ondChangeEnd: audioPlayer.seek,
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StreamBuilder<SequenceState?>(
                        stream: audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                              iconSize: Dimensions.height5 * 9,
                              onPressed: audioPlayer.hasPrevious
                                  ? audioPlayer.seekToPrevious
                                  : null,
                              icon: const Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                              ));
                        }),
                    StreamBuilder<PlayerState>(
                      stream: audioPlayer.playerStateStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final playerState = snapshot.data;
                          final processingState = playerState!.processingState;
                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering) {
                            return Container(
                              width: Dimensions.width20 * 3,
                              height: Dimensions.height20 * 3,
                              margin: EdgeInsets.all(Dimensions.height10),
                              child: const Loader(),
                            );
                          } else if (!audioPlayer.playing) {
                            return IconButton(
                              onPressed: audioPlayer.play,
                              iconSize:
                                  Dimensions.iconSize70 + Dimensions.height5,
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                            );
                          } else if (processingState !=
                              ProcessingState.completed) {
                            return IconButton(
                              onPressed: audioPlayer.play,
                              iconSize:
                                  Dimensions.iconSize70 + Dimensions.height5,
                              icon: const Icon(
                                Icons.pause_circle,
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return IconButton(
                              onPressed: () => audioPlayer.seek(Duration.zero,
                                  index: audioPlayer.effectiveIndices!.first),
                              iconSize:
                                  Dimensions.iconSize70 + Dimensions.height5,
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
                    ),
                    StreamBuilder<SequenceState?>(
                        stream: audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                              iconSize: Dimensions.height5 * 9,
                              onPressed: audioPlayer.hasNext
                                  ? audioPlayer.seekToNext
                                  : null,
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              ));
                        }),
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
