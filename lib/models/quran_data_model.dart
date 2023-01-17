import 'dart:convert';

import 'package:music_app/models/quran_edition_model.dart';
import 'package:music_app/models/quran_surah_model.dart';

class Data {
  List<Surahs>? surahs;
  Edition? edition;

  Data({this.surahs, this.edition});
  Map<String, dynamic> toMap() {
    return {
      "surahs": surahs,
      "edition": edition,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      edition: map['edition'] ?? '',
      surahs: map['surahs'] != null
          ? List<Surahs>.from(map['surahs']?.map((x) => Surahs.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}
