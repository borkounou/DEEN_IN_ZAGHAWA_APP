import 'package:music_app/models/quran_ayah_model.dart';
import 'dart:convert';

import 'song_model.dart';

class Surahs {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Surahs(
      {this.number,
      this.name,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.ayahs});
  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "englishName": englishName,
      "englishNameTranslation": englishNameTranslation,
      "revelationType": revelationType,
      "ayahs": ayahs,
    };
  }

  factory Surahs.fromMap(Map<String, dynamic> map) {
    return Surahs(
      number: map['number'],
      name: map['name'] ?? '',
      englishName: map['englishName'] ?? '',
      englishNameTranslation: map['englishNameTranslation'] ?? '',
      revelationType: map['revelationType'] ?? '',
      ayahs: map['ayahs'] != null
          ? List<Ayahs>.from(map['ayahs']?.map((x) => Ayahs.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Surahs.fromJson(String source) => Surahs.fromMap(json.decode(source));
}
