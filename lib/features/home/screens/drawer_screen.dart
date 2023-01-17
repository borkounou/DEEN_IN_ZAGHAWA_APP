import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../widgets/custom_app_bar.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: GlobalVariables.mainGradientColor,
      ),
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(),
        // appBar: const CustomAppBar(),
      ),
    );
  }
}
