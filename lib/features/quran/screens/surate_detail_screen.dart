import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/commons/common_text.dart';

import '../../../constants/dimensions.dart';
import '../../../constants/global_variables.dart';
import '../../../models/quran_surah_model.dart';
import '../../../utils/style.dart';

class SurahDetailBodyView extends StatefulWidget {
  static const String routeName = '/surahDetailBody';
  final Surahs surahs;
  const SurahDetailBodyView({
    Key? key,
    required this.surahs,
  }) : super(key: key);
  @override
  State<SurahDetailBodyView> createState() => _SurahDetailBodyViewState();
}

class _SurahDetailBodyViewState extends State<SurahDetailBodyView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.mainGradientColor),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(Dimensions.height50 * 0.5),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: Dimensions.height50 * 4,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/main_img/askar_4.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimensions.height10,
                      child: Column(
                        children: [
                          CommonText(
                              text: widget.surahs.englishName!,
                              fontSize: Dimensions.font26),
                          SizedBox(height: Dimensions.height10),
                          Text(widget.surahs.englishNameTranslation!,
                              style: textTitle),
                          SizedBox(height: Dimensions.height10),
                          Divider(
                            height: Dimensions.height20,
                            thickness: Dimensions.height20,
                            color: Colors.white,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.surahs.revelationType!} .',
                                  style: textTitle),
                              SizedBox(width: Dimensions.height10 / 4),
                              SvgPicture.asset(
                                "assets/main_img/no.svg",
                                height: Dimensions.height10,
                              ),
                              SizedBox(width: Dimensions.height10 / 4),
                              Text("${widget.surahs.ayahs?.length}",
                                  style: textTitle)
                            ],
                          ),
                          SizedBox(height: Dimensions.height30),
                          Text(widget.surahs.name!, style: textTitle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: widget.surahs.ayahs?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height20,
                            top: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                          "assets/main_img/no.svg"),
                                    ),
                                    Positioned(
                                      child: Text(
                                          '${widget.surahs.ayahs![index].numberInSurah}',
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: Dimensions.height10),
                            Text(
                              widget.surahs.ayahs![index].text!,
                              style: textTitle,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
