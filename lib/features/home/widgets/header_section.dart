import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final String action;
  const HeaderSection(
      {Key? key, required this.title, this.action = "View more"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          action,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
