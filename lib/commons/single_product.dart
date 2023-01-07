import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: Colors.white),
        child: Container(
          height: Dimensions.height50 * 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover)),
          width: Dimensions.carouselImageHeight + Dimensions.height30 * 2,
          padding: const EdgeInsets.all(2),
        ),
      ),
    );
  }
}
