import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:music_app/constants/global_variables.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/models/song_model.dart';
import 'package:music_app/utils/error_handling.dart';

import '../../../utils/show_snack_bar.dart';

class AdminServices {
  void addSong({
    required BuildContext context,
    required String id,
    required String title,
    required String description,
    required String category,
    required File audio,
    required String author,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dssamvdt6', "j43yuvpy");
      String imageUrls = "";
      String audioUrls = "";

      CloudinaryResponse res1 = await cloudinary
          .uploadFile(CloudinaryFile.fromFile(audio.path, folder: category));
      audioUrls = res1.secureUrl;
      if (category == 'Ramadan') {
        imageUrls =
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672540091/xsckvb9cpmusqsc46yun.jpg";
      } else if (category == 'Sakaat') {
        imageUrls =
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672540090/oxvyrilov5emzb6qnkcn.jpg";
      } else if (category == 'Salaat') {
        imageUrls =
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672540089/assa9jhnkdglegr3axcv.jpg";
      } else {
        imageUrls =
            "https://res.cloudinary.com/dssamvdt6/image/upload/v1672540089/xgqaymim6ltqmmf2hjlj.jpg";
      }

      Song product = Song(
        id: id,
        title: title,
        description: description,
        url: audioUrls,
        coverUrl: imageUrls,
        category: category,
        author: author,
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-song'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': '',
        },
        body: product.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context: context,
                text: 'Product added Successfully!',
                color: Colors.purpleAccent);
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }

  void addPlaylist({
    required BuildContext context,
    required String title,
    required String author,
    required String category,
    required File image,
  }) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dssamvdt6', "j43yuvpy");
      String imageUrls = "";

      CloudinaryResponse res1 = await cloudinary
          .uploadFile(CloudinaryFile.fromFile(image.path, folder: category));
      imageUrls = res1.secureUrl;

      Playlist playlist = Playlist(
          song: [],
          title: title,
          imageUrl: imageUrls,
          category: category,
          author: author);

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-playlist'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': '',
        },
        body: playlist.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context: context,
                text: 'Playlist added Successfully!',
                color: Colors.purpleAccent);
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }
}
