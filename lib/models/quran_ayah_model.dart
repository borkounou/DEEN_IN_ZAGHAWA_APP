import 'dart:convert';

class Ayahs {
  int? number;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  // bool? sajda;

  Ayahs({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    // this.sajda,
  });

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "text": text,
      "numberInSurah": numberInSurah,
      "juz": juz,
      "manzil": manzil,
      "page": page,
      "ruku": ruku,
      "hizbQuarter": hizbQuarter,
      // "sajda": sajda,
    };
  }

  factory Ayahs.fromMap(Map<String, dynamic> map) {
    return Ayahs(
      number: map['number'] ?? '',
      text: map['text'] ?? '',
      numberInSurah: map['numberInSurah'] ?? '',
      juz: map['juz'] ?? '',
      manzil: map['manzil'] ?? '',
      page: map['page'] ?? '',
      ruku: map['ruku'] ?? '',
      hizbQuarter: map['hizbQuarter'] ?? '',
      // sajda: map['sajda'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ayahs.fromJson(String source) => Ayahs.fromMap(json.decode(source));
}
