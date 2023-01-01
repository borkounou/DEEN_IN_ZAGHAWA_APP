import 'dart:convert';

// taskkill /F /IM "qemu-system-x86_64.exe" /T
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/utils/error_handling.dart';
import 'package:music_app/utils/show_snack_bar.dart';

class HomeServices {
  Future<List<Playlist>> fetchProducts({required BuildContext context}) async {
    List<Playlist> playlist = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-playlist'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': '',
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              playlist.add(
                Playlist.fromJson(
                  jsonEncode(jsonDecode(res.body)[i]),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
    return playlist;
  }
}
