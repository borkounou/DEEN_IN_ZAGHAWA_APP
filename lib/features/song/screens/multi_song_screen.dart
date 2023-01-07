import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/widgets/progressbar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class MultiSongScreen extends StatefulWidget {
  final List<Song> song;
  const MultiSongScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<MultiSongScreen> createState() => _MultiSongScreenState();
}

class _MultiSongScreenState extends State<MultiSongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  ConcatenatingAudioSource? _playlistSong;

  void _updatePlaylist() {
    _playlistSong = ConcatenatingAudioSource(
        children: widget.song
            .map((song) => AudioSource.uri(
                  Uri.parse(song.url),
                  tag: {
                    "title": song.title,
                    "category": song.category,
                    "author": song.author
                  },
                ))
            .toList());
  }

  Stream<PositionData> get _positionDataStream =>
      rxdart.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    audioPlayer.positionStream;
    audioPlayer.bufferedPositionStream;
    audioPlayer.durationStream;
    _init();
    _updatePlaylist();
  }

  Future<void> _init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(_playlistSong!);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AudioPlayersScreen extends StatefulWidget {
  static const String routeName = '/audioPlayScreen';
  const AudioPlayersScreen({Key? key}) : super(key: key);

  @override
  State<AudioPlayersScreen> createState() => _AudioPlayersScreenState();
}

class _AudioPlayersScreenState extends State<AudioPlayersScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  final String audioPath =
      "https://res.cloudinary.com/dssamvdt6/video/upload/v1672613264/Ramadan/uljbju1jhwaqnxvcmjr7.mp3";
  final String imagePath =
      "https://res.cloudinary.com/dssamvdt6/image/upload/v1672539724/Sakaat/kfw7cal27cay8tksch1w.jpg";

  List<Song> playlistSongs = [];
  ConcatenatingAudioSource? _playlistSong;

  void _updatePlaylist() {
    _playlistSong = ConcatenatingAudioSource(
        children: playlistSongs
            .map((song) => AudioSource.uri(
                  Uri.parse(song.url),
                  tag: {"title": song.title, "category": song.category},
                ))
            .toList());
  }

  final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse(
          "https://res.cloudinary.com/dssamvdt6/video/upload/v1672613264/Ramadan/uljbju1jhwaqnxvcmjr7.mp3"),
      tag: {
        "title": "Nature sounds",
        "artist": "Public Domain",
        "artUri":
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672539724/Sakaat/kfw7cal27cay8tksch1w.jpg",
      },
    ),
    AudioSource.uri(
      Uri.parse(
          "https://res.cloudinary.com/dssamvdt6/video/upload/v1672613264/Ramadan/uljbju1jhwaqnxvcmjr7.mp3"),
      tag: {
        "title": "Nature sounds 2",
        "artist": "Public Domain",
        "artUri":
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672539724/Sakaat/kfw7cal27cay8tksch1w.jpg",
      },
    ),
    AudioSource.uri(
      Uri.parse(
          "https://res.cloudinary.com/dssamvdt6/video/upload/v1672539829/Ramadan/rf63cuo7hgqhdy5j2uwx.mp3"),
      tag: {
        "title": "Nature Sounds 3",
        "artist": "Public Domain",
        "artUri":
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672539724/Sakaat/kfw7cal27cay8tksch1w.jpg",
      },
    ),
  ]);

  Stream<PositionData> get _positionDataStream =>
      rxdart.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer()..setAsset("assets/sounds/beri.mp3");
    audioPlayer.positionStream;
    audioPlayer.bufferedPositionStream;
    audioPlayer.durationStream;
    _init();
  }

  Future<void> _init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
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
          Image.network(
            imagePath,
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
              vertical: Dimensions.height20 * 3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: "Song title",
                  color: Colors.white,
                  size: Dimensions.font16,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                BigText(
                  text: "Song author",
                  color: Colors.white,
                  size: Dimensions.font12,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ProgressBar(
                            barHeight: 8,
                            baseBarColor: Colors.grey[600],
                            bufferedBarColor: Colors.grey,
                            progressBarColor: Colors.redAccent,
                            thumbColor: Colors.redAccent,
                            timeLabelTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            onSeek: audioPlayer.seek,
                            progress: positionData?.position ?? Duration.zero,
                            buffered:
                                positionData?.bufferedPosition ?? Duration.zero,
                            total: positionData?.duration ?? Duration.zero),
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StreamBuilder<SequenceState?>(
                        stream: audioPlayer.sequenceStateStream,
                        builder: (context, snapshot) {
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
                    Controls(
                      audioPlayer: audioPlayer,
                      iconSize: Dimensions.iconSize70,
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

class MediaMetadata extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  const MediaMetadata(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 4),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          artist,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
