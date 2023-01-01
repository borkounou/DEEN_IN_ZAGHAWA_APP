import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/commons/custom_button.dart';
import 'package:music_app/commons/custom_textfield.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/admin/services/adminServices.dart';
import 'dart:io';
import 'package:music_app/utils/pick_image_file.dart';

class AddPlaylistScreen extends StatefulWidget {
  // final Playlist playlist;
  const AddPlaylistScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/addPlaylistScreen';
  @override
  State<AddPlaylistScreen> createState() => _AddPlaylistScreenState();
}

class _AddPlaylistScreenState extends State<AddPlaylistScreen> {
  AdminServices adminServices = AdminServices();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  final _addProductFormKey = GlobalKey<FormState>();

  File image = File('');
  String category = 'Ramadan';

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    authorController.dispose();
  }

  List<String> productCategory = [
    'Ramadan',
    'Salaat',
    'Sakaat',
    'Vie sociale',
    'Mariage',
    'Autres'
  ];

  void selectImage() async {
    var result = await pickImages();
    setState(() {
      image = result;
    });
  }

  void addPlaylist() {
    if (_addProductFormKey.currentState!.validate() && image.path != "") {
      adminServices.addPlaylist(
          context: context,
          title: titleController.text,
          author: authorController.text,
          category: category,
          image: image);
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
                children: const [
                  Text('Add Playlist', style: TextStyle(color: Colors.black)),
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
                  image.path != ""
                      ? Container(
                          margin: EdgeInsets.all(Dimensions.height10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: Dimensions.imgConMarginTop200,
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            selectImage();
                          },
                          child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(Dimensions.radius15),
                              dashPattern: const [10, 4],
                              strokeCap: StrokeCap.round,
                              child: Container(
                                width: double.infinity,
                                height: Dimensions.height50 * 3,
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
                      controller: titleController, hintText: "Title"),
                  SizedBox(height: Dimensions.height10),
                  CustomTextField(
                      controller: authorController, hintText: "author"),
                  SizedBox(height: Dimensions.height10),
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
                  CustomButton(text: 'Ajouter', onTap: addPlaylist),
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
