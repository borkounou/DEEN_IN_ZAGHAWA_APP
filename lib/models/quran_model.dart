import 'dart:convert';

import 'package:music_app/models/quran_data_model.dart';

class QuranData {
  int? code;
  String? status;
  Data? data;

  QuranData({this.code, this.status, this.data});

  Map<String, dynamic> toMap() {
    return {
      "code": code,
      "status": status,
      "data": data,
    };
  }

  factory QuranData.fromMap(Map<String, dynamic> map) {
    return QuranData(
      code: map['code'],
      status: map['status'] ?? '',
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuranData.fromJson(String source) =>
      QuranData.fromMap(json.decode(source));
}
