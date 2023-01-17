import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const CommonText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.fontWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: "Avenir",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
