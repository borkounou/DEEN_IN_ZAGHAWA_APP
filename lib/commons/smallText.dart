import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  const SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      this.size = 0,
      this.height = 1.2,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        // fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font12 : size,
        height: height,
      ),
    );
  }
}
