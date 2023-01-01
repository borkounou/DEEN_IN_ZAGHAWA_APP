import 'package:flutter/material.dart';
import 'package:music_app/features/admin/screens/add_playlist_page.dart';
import 'package:music_app/features/admin/screens/add_song_page.dart';
import 'package:music_app/features/admin/screens/adminPlaylistScreen.dart';
import 'package:music_app/features/home/screens/home_screen.dart';
import 'package:music_app/features/playlist/screens/playlist_screen.dart';
import 'package:music_app/features/song/screens/song_screen.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/models/song_model.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );

    case PlaylistScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PlaylistScreen(playlist: playlist),
      );

    case AdminPlaylistScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AdminPlaylistScreen(playlist: playlist),
      );

    case AddSongScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddSongScreen(playlist: playlist),
      );

    case AddPlaylistScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddPlaylistScreen(),
      );

    case SongScreen.routeName:
      var song = routeSettings.arguments as Song;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SongScreen(song: song),
      );

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen does not exist"),
                ),
              ));
  }
}
