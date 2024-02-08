import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:music_app/utils/error_handling.dart';
import 'package:music_app/utils/show_snack_bar.dart';
import 'package:music_app/models/quran_surah_model.dart';

// taskkill /F /IM "qemu-system-x86_64.exe" /T

class QuranServices {
  Future<List<Surahs>> fetchSurahs(
      {required BuildContext context, required String model}) async {
    List<Surahs> surahs = [];

    Directory tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/quranTemp.txt');
    bool fileExists = await file.exists();

    if (fileExists) {
      String data = await file.readAsString();

      for (int i = 0; i < jsonDecode(data)["data"]["surahs"].length; i++) {
        surahs.add(
          Surahs.fromJson(
            jsonEncode(jsonDecode(data)["data"]["surahs"][i]),
          ),
        );
      }
    } else {
      http.Response res = await http.get(
          Uri.parse('https://api.alquran.cloud/v1/quran/$model'),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
            'x-auth-token': '',
          });

      file.writeAsStringSync(res.body, flush: true, mode: FileMode.write);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0;
                i < jsonDecode(res.body)["data"]["surahs"].length;
                i++) {
              surahs.add(
                Surahs.fromJson(
                  jsonEncode(jsonDecode(res.body)["data"]["surahs"][i]),
                ),
              );
            }
          });
    }

    return surahs;
  }
}
