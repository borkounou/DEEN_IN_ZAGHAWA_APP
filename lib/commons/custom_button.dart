import 'package:flutter/material.dart';
import 'package:music_app/commons/bigText.dart';
import 'package:music_app/constants/dimensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent,
          minimumSize: Size(
            double.infinity,
            Dimensions.height50,
          ),
        ),
        onPressed: onTap,
        child: BigText(
          text: text,
          color: Colors.white,
          size: Dimensions.iconSize24,
        ));
  }
}
