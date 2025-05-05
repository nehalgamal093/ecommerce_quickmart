import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:ecommerce_shop/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  final String title;
  final String img;
  const SomethingWentWrongWidget(
      {super.key, required this.title, required this.img});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: size.width * .7,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: context
                  .titleMedium!
                  .copyWith(color: ColorsManager.redColor),
            ),
          ],
        ),
      ),
    );
  }
}
