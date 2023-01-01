import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/commons/smallText.dart';
import 'package:music_app/constants/dimensions.dart';
import 'package:music_app/features/search/widgets/search_box.dart';
import 'package:music_app/features/search/widgets/search_cards.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.height5 * 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width10),
                      child: BigText(
                        text: "Chercher",
                        color: Colors.white,
                        size: Dimensions.font26,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    const SearchBox(),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width10),
                      child: SmallText(
                        text: "Toutes les categories",
                        size: Dimensions.font16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: const [
                            SearchCards(
                              text: 'Ramadan',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.purpleAccent,
                            ),
                            SearchCards(
                              text: 'Zakat',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SearchCards(
                              text: 'Tawahid',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.blueAccent,
                            ),
                            SearchCards(
                              text: 'Salat',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.greenAccent,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SearchCards(
                              text: 'Société',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.black45,
                            ),
                            SearchCards(
                              text: 'Jumah',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.brown,
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SearchCards(
                              text: 'Hajj',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.black87,
                            ),
                            SearchCards(
                              text: 'Autres',
                              img: './assets/main_img/askar_3.jpg',
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
