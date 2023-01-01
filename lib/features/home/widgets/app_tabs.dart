import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class AppTabs extends StatelessWidget {
  final String text;
  final Color color;
  const AppTabs({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ]),
      width: Dimensions.width20 * 6,
      height: Dimensions.height10 * 5,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: Dimensions.font20),
      ),
    );
  }
}
