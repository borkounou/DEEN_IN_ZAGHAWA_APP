import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/commons/custom_button.dart';
import 'package:music_app/commons/custom_textfield.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/admin/screens/add_playlist_page.dart';
import 'package:music_app/features/admin/services/adminServices.dart';
import 'package:music_app/models/playlist_model.dart';
import 'package:music_app/utils/pick_audio_file.dart';
import 'dart:io';

class AddSongScreen extends StatefulWidget {
  final Playlist playlist;
  const AddSongScreen({Key? key, required this.playlist}) : super(key: key);

  static const String routeName = '/addSongScreen';

  @override
  State<AddSongScreen> createState() => _AddSongScreenState();
}

class _AddSongScreenState extends State<AddSongScreen> {
  // final AdminServices adminServices = AdminServices();
  AdminServices adminServices = AdminServices();
  final TextEditingController songTitleController = TextEditingController();
  final TextEditingController songAuthorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final _addProductFormKey = GlobalKey<FormState>();

  File audio = File("");
  String category = 'Ramadan';

  @override
  void dispose() {
    super.dispose();
    songTitleController.dispose();
    descriptionController.dispose();
    songAuthorController.dispose();
  }

  List<String> productCategory = [
    'Ramadan',
    'Salaat',
    'Sakaat',
    'Vie sociale',
    'Mariage',
    'Autres'
  ];

  void selectAudio() async {
    var result = await pickAudioFile();
    setState(() {
      audio = result;
    });
  }

  void addSong() {
    if (_addProductFormKey.currentState!.validate() && audio.path != "") {
      adminServices.addSong(
          context: context,
          id: widget.playlist.id!,
          title: songTitleController.text,
          description: descriptionController.text,
          category: category,
          audio: audio,
          author: songAuthorController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ])),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.height50),
          child: AppBar(
            flexibleSpace: Container(
                // decoration: BoxDecoration(gradient: Colors.transparent),
                ),
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Song',
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      iconSize: Dimensions.iconSize28,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AddPlaylistScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  audio.path != ""
                      ? Container(
                          margin: EdgeInsets.all(Dimensions.height10),
                          child: Text(
                              "The uploaded file has ${audio.lengthSync()} bytes"),
                        )
                      : GestureDetector(
                          onTap: selectAudio,
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(Dimensions.radius15),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      size: Dimensions.iconSize24 * 2,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height15,
                                    ),
                                    BigText(
                                      text: 'Select Audio files',
                                      size: Dimensions.height15,
                                      color: Colors.grey.shade400,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                  SizedBox(height: Dimensions.height10 * 3),
                  CustomTextField(
                      controller: songTitleController, hintText: "Title"),
                  SizedBox(height: Dimensions.height10),
                  CustomTextField(
                      controller: songAuthorController, hintText: "Author"),
                  SizedBox(height: Dimensions.height10),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: "Description",
                    maxLines: 7,
                  ),
                  SizedBox(height: Dimensions.height10),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: productCategory.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(color: Colors.black45),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newCategory) {
                        setState(() {
                          category = newCategory!;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  CustomButton(text: 'Ajouter', onTap: addSong),
                  SizedBox(height: Dimensions.height10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
