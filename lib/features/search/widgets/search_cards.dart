import 'package:flutter/material.dart';
import 'package:music_app/commons/smallText.dart';
import 'package:music_app/constants/dimensions.dart';

class SearchCards extends StatelessWidget {
  final String text;
  final String img;
  final Color color;
  const SearchCards(
      {Key? key, required this.text, required this.img, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CardGenre(
              text: text,
              img: img,
              color: color,
            ),
          ],
        )
      ],
    );
  }
}

class CardGenre extends StatelessWidget {
  final String text;
  final String img;
  final Color color;
  const CardGenre(
      {Key? key, required this.text, required this.img, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: Dimensions.width10 * 17.7,
        height: Dimensions.height10 * 9,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SmallText(
                  text: text,
                  color: Colors.white,
                  size: Dimensions.font20,
                ),
              ],
            ),
            Transform.rotate(
              angle: 0.3,
              child: Image(
                width: Dimensions.width10 * 7,
                height: Dimensions.height10 * 6,
                image: AssetImage(
                  img,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
