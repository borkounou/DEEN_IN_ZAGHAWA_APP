import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class SearchBox extends StatelessWidget {
  final double size;
  const SearchBox({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 5,
      padding: EdgeInsets.only(left: size, right: size),
      // margin: EdgeInsets.only(left: Dimensions.width5),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.height10 - 3),
        elevation: 0,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.width5,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Dimensions.iconSize24,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.black12,
            contentPadding: EdgeInsets.only(top: Dimensions.height10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.height10 - 3),
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.height10 - 3),
              ),
              borderSide: const BorderSide(color: Colors.black38, width: 1),
            ),
            hintText: "Artistes,categories ou surates",
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: Dimensions.font12,
            ),
          ),
        ),
      ),
    );
  }
}
