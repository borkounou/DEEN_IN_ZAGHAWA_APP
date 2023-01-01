import 'package:flutter/material.dart';
import 'package:music_app/constants/dimensions.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 4,
      margin: EdgeInsets.only(left: Dimensions.width10),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.height10 - 3),
        elevation: 1,
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
            hintText: "Artistes,douah ou podcasts",
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.font16,
            ),
          ),
        ),
      ),
    );
  }
}
