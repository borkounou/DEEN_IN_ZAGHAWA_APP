import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

import '../../search/widgets/search_box.dart';

class DiscoverMusic extends StatelessWidget {
  const DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bienvenue", style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            height: Dimensions.height5,
          ),
          Text(
            "Paix et joie de l'islam par audio",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          SearchBox(
            size: Dimensions.width5 / 2,
          ),
        ],
      ),
    );
  }
}
