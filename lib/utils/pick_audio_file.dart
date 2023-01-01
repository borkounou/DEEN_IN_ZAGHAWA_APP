import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

Future<File> pickAudioFile() async {
  File audio = File("");
  try {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      File file = File(result.files.single.path!);
      audio = file;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return audio;
}
