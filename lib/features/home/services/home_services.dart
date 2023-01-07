import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/utils/error_handling.dart';
import 'package:music_app/utils/show_snack_bar.dart';
import 'package:path_provider/path_provider.dart';
// taskkill /F /IM "qemu-system-x86_64.exe" /T

class HomeServices {
  Timer? cacheTimer;
  Future<List<Playlist>> fetchProducts({required BuildContext context}) async {
    List<Playlist> playlist = [];
    try {
      Directory tempDir = await getTemporaryDirectory();
      File file = File('${tempDir.path}/temp.txt');
      bool fileExists = await file.exists();

      if (fileExists) {
        String data = await file.readAsString();
        print("Loading from cache");
        for (int i = 0; i < jsonDecode(data).length; i++) {
          playlist.add(
            Playlist.fromJson(
              jsonEncode(jsonDecode(data)[i]),
            ),
          );
        }
      } else {
        print("Loading from API");
        http.Response res =
            await http.get(Uri.parse('$uri/api/get-playlist'), headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': '',
        });

        file.writeAsStringSync(res.body, flush: true, mode: FileMode.write);

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
      }
      // Start the timer to refresh the cache every 2 minutes
      cacheTimer = Timer.periodic(const Duration(minutes: 20), (timer) {
        refreshCache(context: context);
      });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
    return playlist;
  }

  void refreshCache({required BuildContext context}) async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      File file = File('${tempDir.path}/temp.txt');
      http.Response res =
          await http.get(Uri.parse('$uri/api/get-playlist'), headers: {
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': '',
      });

      String data = await file.readAsString();
      if (data != res.body) {
        file.writeAsStringSync(res.body, flush: true, mode: FileMode.write);
      }

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            if (data != res.body) {
              print("Cache refreshed");
            } else {
              print("Noting to update");
            }
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }
}
