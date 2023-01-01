import 'package:flutter/material.dart';
import 'package:music_app/commons/single_product.dart';
import 'package:music_app/constants/dimensions.dart';

class CarouselImage extends StatelessWidget {
  final PageController pageController;
  final List<String> productImg;
  const CarouselImage(
      {Key? key, required this.pageController, required this.productImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        color: Colors.transparent,
      ),
      height: Dimensions.imgConMarginTop200 +
          Dimensions.height50 +
          Dimensions.height20,
      child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: productImg.length,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleProduct(
                  image: productImg[index],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height10),
                  height: Dimensions.height50,
                  width: Dimensions.height50 * 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height15),
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Title",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.play_circle,
                        color: Colors.deepPurple,
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
