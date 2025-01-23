import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:flutter/material.dart';
import '../../../resources/colors/colors_manager.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
        Text(
          'Skip for now',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorsManager.cyanColor),
        )
      ],
    );
  }
}
