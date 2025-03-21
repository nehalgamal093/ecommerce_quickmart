import 'package:flutter/material.dart';
import '../../../../../../view/resources/colors/colors_manager.dart';

class ColorsBar extends StatelessWidget {
  const ColorsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(
          backgroundColor: ColorsManager.subBlue,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.greyColor,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.blueColor,
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.blackColor,
        ),
      ],
    );
  }
}
