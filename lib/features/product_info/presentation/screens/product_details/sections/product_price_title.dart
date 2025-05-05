import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

class ProductPriceTitle extends StatelessWidget {
  final String name;
  final String price;
  final String priceAfterDiscount;
  const ProductPriceTitle(
      {super.key,
      required this.name,
      required this.price,
      required this.priceAfterDiscount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: context.titleLarge!.copyWith(fontSize: 18),
        ),
        Column(
          children: [
            Text(
              price,
              style: context.titleLarge!.copyWith(fontSize: 18),
            ),
            Text(
              priceAfterDiscount,
              style: context.bodySmall!
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
          ],
        )
      ],
    );
  }
}
