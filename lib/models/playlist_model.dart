import 'dart:convert';

import 'song_model.dart';

class Playlist {
  final String? id;
  final String title;
  final List<Song>? song;
  final String imageUrl;
  final String category;
  final String author;

  Playlist({
    this.id,
    required this.title,
    this.song,
    required this.imageUrl,
    required this.category,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "song": song,
      "imageUrl": imageUrl,
      "category": category,
      "author": author,
    };
  }

  factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      id: map['_id'],
      title: map['title'] ?? '',
      song: map['song'] != null
          ? List<Song>.from(map['song']?.map((x) => Song.fromMap(x)))
          : null,
      imageUrl: map['imageUrl'],
      category: map['category'] ?? '',
      author: map['author'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Playlist.fromJson(String source) =>
      Playlist.fromMap(json.decode(source));
}
