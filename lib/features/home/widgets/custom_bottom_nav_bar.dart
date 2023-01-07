import 'package:flutter/material.dart';
import 'package:music_app/models/playlist_model.dart';

class CustomNavigationBar extends StatelessWidget {
  final void Function(int) updatePage;
  final int page;
  const CustomNavigationBar(
      {Key? key, required this.updatePage, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = [];
    return BottomNavigationBar(
      onTap: updatePage,
      currentIndex: page,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      // unselectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_music), label: "Music"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: "Favorites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline), label: "Profile"),
      ],
    );
  }
}
