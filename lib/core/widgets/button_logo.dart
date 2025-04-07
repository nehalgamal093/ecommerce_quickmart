import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class ButtonLogo extends StatelessWidget {
  final String image;
  const ButtonLogo({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorsManager.lightCyanColor,
        borderRadius: BorderRadius.circular(12)
      ),
    child: Image.asset(image,height:50),
    );
  }
}
