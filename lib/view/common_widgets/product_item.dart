import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(ImagesManager.product1),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.blackColor,
              ),
              child: ImageIcon(
                AssetImage(ImagesManager.heartIcon),
                color: ColorsManager.whiteColor,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Nike air jordan retro fashion',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
        ),
        Text(
          '\$126.00',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
        ),
        Text(
          '\$186.00',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.lightGreyColor,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.lineThrough,
              decorationColor: ColorsManager.lightGreyColor),
        )
      ],
    );
  }
}
