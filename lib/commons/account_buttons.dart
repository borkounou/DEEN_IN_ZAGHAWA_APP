import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final VoidCallback ontTap;
  final Color color;
  const AccountButton(
      {Key? key, required this.text, required this.ontTap, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.width10, vertical: Dimensions.height20),
      height: Dimensions.height50 - Dimensions.height10,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 0.0),
        borderRadius: BorderRadius.circular(Dimensions.height50),
        color: color,
      ),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black12.withOpacity(0.03),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.height50),
          ),
        ),
        onPressed: ontTap,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: Dimensions.font16),
        ),
      ),
    );
  }
}
