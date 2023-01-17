import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/dimensions.dart';
import 'common_text.dart';

class MediaMetadata extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  const MediaMetadata(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(2, 4),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(Dimensions.height10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.height10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: Dimensions.height30 * 10,
              width: Dimensions.containerWidth150 * 2,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20),
        CommonText(title: title),
        SizedBox(height: Dimensions.height10),
        CommonText(title: artist)
      ],
    );
  }
}
