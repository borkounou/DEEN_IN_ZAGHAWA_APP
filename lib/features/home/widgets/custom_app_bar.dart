import 'package:flutter/material.dart';
import '../../../constants/dimensions.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: EdgeInsets.only(right: Dimensions.width20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://res.cloudinary.com/dssamvdt6/image/upload/v1672539724/Sakaat/kfw7cal27cay8tksch1w.jpg",
            ),
          ),
        )
      ],
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(56);
}
