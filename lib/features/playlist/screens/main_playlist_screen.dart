import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/features/song/widgets/profile_stream_builder.dart';
import 'package:music_app/models/playlist_model.dart';
import '../../song/services/audio_services.dart';
import '../widgets/play_shuffle_switch.dart';

class MainPlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  static const String routeName = '/mainPlaylist';
  const MainPlaylistScreen({Key? key, required this.playlist})
      : super(key: key);
  @override
  State<MainPlaylistScreen> createState() => _MainPlaylistScreenState();
}

class _MainPlaylistScreenState extends State<MainPlaylistScreen> {
  AudioServices audioServices = AudioServices();
  AudioPlayer _audioPlayer = AudioPlayer();
  ConcatenatingAudioSource? _playlistSong;

  void _initAudio() {
    _audioPlayer = audioServices.audioPlayer;
  }

  void _updatePlaylist() {
    _playlistSong = audioServices.updatePlaylist(songs: widget.playlist.song!);
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
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.mainGradientColor),
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
                ProfileStreamBuilder(audioPlayer: _audioPlayer),
                SizedBox(
                  height: Dimensions.height30,
                ),
                PlayOrShuffleSwitch(
                  audioPlayer: _audioPlayer,
                  songs: widget.playlist.song!,
                ),
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
