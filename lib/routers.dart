import 'package:flutter/material.dart';
import 'package:music_app/features/admin/screens/add_playlist_page.dart';
import 'package:music_app/features/admin/screens/add_song_page.dart';
import 'package:music_app/features/admin/screens/adminPlaylistScreen.dart';
import 'package:music_app/features/home/screens/home_screen.dart';
import 'package:music_app/features/home/widgets/playlist_card.dart';
import 'package:music_app/features/playlist/screens/main_playlist_screen.dart';
import 'package:music_app/features/playlist/screens/playlist_screen.dart';
import 'package:music_app/features/playlist/screens/search_playlist_screen.dart';
import 'package:music_app/features/quran/screens/surate_detail_screen.dart';
import 'package:music_app/features/song/screens/single_song_screen.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/models/quran_surah_model.dart';
import 'package:music_app/models/song_model.dart';

import 'features/home/screens/bottom_bar_home_screen.dart';
import 'features/song/screens/multi_song_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case BottomBarHomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBarHomeScreen(),
      );
    case HomeScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(playlist: playlist),
      );

    case SurahDetailBodyView.routeName:
      var surahs = routeSettings.arguments as Surahs;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SurahDetailBodyView(surahs: surahs),
      );

    case PlaylistScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PlaylistScreen(playlist: playlist),
      );

    case SearchPlaylistScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchPlaylistScreen(playlist: playlist),
      );

    case PlaylistCard.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PlaylistCard(
                playlist: playlist,
              ));

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

    case SingleSongScreen.routeName:
      var song = routeSettings.arguments as Song;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SingleSongScreen(song: song),
      );

    case MultiSongScreen.routeName:
      var song = routeSettings.arguments as List<Song>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiSongScreen(song: song),
      );

    case MainPlaylistScreen.routeName:
      var playlist = routeSettings.arguments as Playlist;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MainPlaylistScreen(
          playlist: playlist,
        ),
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
