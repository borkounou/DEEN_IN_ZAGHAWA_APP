import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/song/widgets/progressbar.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

class MainPlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  static const String routeName = '/mainPlaylist';
  const MainPlaylistScreen({Key? key, required this.playlist})
      : super(key: key);
  @override
  State<MainPlaylistScreen> createState() => _MainPlaylistScreenState();
}

class _MainPlaylistScreenState extends State<MainPlaylistScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  ConcatenatingAudioSource? _playlistSong;

  void _updatePlaylist() {
    _playlistSong = ConcatenatingAudioSource(
        children: widget.playlist.song!
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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Center(
            child: Text("Playlists ${widget.playlist.category}"),
          ),
        ),
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.radius20),
            child: Column(
              children: [
                _PlaylistInformation(
                  playlistImage: widget.playlist.imageUrl,
                  title: widget.playlist.title,
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                _PlayOrShuffleSwitch(audioPlayer: audioPlayer),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.playlist.song!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          widget.playlist.song![index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          widget.playlist.song![index].author,
                        ),
                        trailing: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const _PlayOrShuffleSwitch({Key? key, required this.audioPlayer})
      : super(key: key);

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
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
                      // Icon(
                      //   Icons.play_circle,
                      //   color: isPlay ? Colors.white : Colors.deepPurple,
                      // ),
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

class _PlaylistInformation extends StatelessWidget {
  final String playlistImage;
  final String title;
  const _PlaylistInformation(
      {Key? key, required this.playlistImage, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          child: Image.network(
            playlistImage,
            height: Dimensions.screenHeight * 0.32,
            width: Dimensions.screenWidth * 0.8,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
