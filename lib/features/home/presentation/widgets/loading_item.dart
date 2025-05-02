import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .43,
      height: size.height * .25,
      decoration: BoxDecoration(
        color: ColorsManager.veryLightGreyColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
