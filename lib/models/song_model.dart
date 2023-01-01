import 'dart:convert';

class Song {
  final String? id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  final String category;
  final String author;

  Song({
    this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
    required this.category,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'coverUrl': coverUrl,
      'category': category,
      "author": author,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      coverUrl: map['coverUrl'],
      category: map['category'],
      author: map['author'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory Song.fromJson(String source) => Song.fromMap(json.decode(source));
}
