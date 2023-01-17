import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/commons/loader.dart';
import 'package:music_app/features/quran/screens/surate_detail_screen.dart';
import 'package:music_app/models/quran_surah_model.dart';

import '../../../commons/common_text.dart';
import '../../../constants/dimensions.dart';

class TabVarViewContents extends StatefulWidget {
  final List<Surahs> surahs;
  const TabVarViewContents({
    Key? key,
    required this.surahs,
  }) : super(key: key);

  @override
  State<TabVarViewContents> createState() => _TabVarViewContentsState();
}

class _TabVarViewContentsState extends State<TabVarViewContents> {
  @override
  Widget build(BuildContext context) {
    return widget.surahs.isEmpty
        ? const Loader()
        : ListView.builder(
            itemCount: widget.surahs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SurahDetailBodyView.routeName,
                      arguments: widget.surahs[index]);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      // gradient: GlobalVariables.mainGradientColor,
                      borderRadius: BorderRadius.circular(Dimensions.height10),
                    ),
                    child: Container(
                      // padding: EdgeInsets.all(Dimensions.height10),
                      padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          top: Dimensions.height10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SvgPicture.asset(
                                      "assets/main_img/no.svg",
                                      width: Dimensions.width10 * 5,
                                      height: Dimensions.height50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    child: CommonText(
                                      text: '${widget.surahs[index].number}',
                                      fontSize: Dimensions.font16,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: widget.surahs[index].englishName!,
                                    fontSize: Dimensions.font12,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10,
                                  ),
                                  CommonText(
                                    text:
                                        "${widget.surahs[index].englishNameTranslation} ",
                                    fontSize: Dimensions.font12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CommonText(
                            text: widget.surahs[index].name!,
                            fontSize: Dimensions.font12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
  }
}
