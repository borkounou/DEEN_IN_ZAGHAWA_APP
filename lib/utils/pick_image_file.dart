import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

Future<File> pickImages() async {
  File image = File("");
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      image = file;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return image;
}
