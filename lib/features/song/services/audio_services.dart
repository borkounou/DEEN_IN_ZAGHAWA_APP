import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/models/song_model.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../widgets/progressbar.dart';

class AudioServices {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;
  ConcatenatingAudioSource? playlistSong;

  ConcatenatingAudioSource? updatePlaylist({required List<Song> songs}) {
    playlistSong = ConcatenatingAudioSource(
        children: songs
            .map((song) => AudioSource.uri(
                  Uri.parse(song.url),
                  tag: MediaItem(
                      id: song.id!,
                      title: song.title,
                      artUri: Uri.parse(song.coverUrl),
                      album: song.category,
                      artist: song.author),
                ))
            .toList());
    return playlistSong;
  }

  Stream<PositionData> get positionDataStream =>
      rxdart.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  Future<void> init({required ConcatenatingAudioSource? playlistSong}) async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(playlistSong!);
  }
}
