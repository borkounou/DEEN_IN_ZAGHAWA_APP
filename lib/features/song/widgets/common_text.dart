import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double size;
  const CommonText(
      {Key? key,
      required this.title,
      this.color = Colors.white,
      this.fontWeight = FontWeight.bold,
      this.textAlign = TextAlign.center,
      this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
