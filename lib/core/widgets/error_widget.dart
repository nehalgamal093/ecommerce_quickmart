import 'package:ecommerce_shop/core/resources/colors/colors_manager.dart';
import '../../../../core/resources/constants/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager/images_manager.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key});

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
              ImagesManager.somethingWrong,
              width: size.width * .7,
            ),
            Text(
              StringsManager.somethingWentWrong,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorsManager.redColor),
            ),
          ],
        ),
      ),
    );
  }
}
