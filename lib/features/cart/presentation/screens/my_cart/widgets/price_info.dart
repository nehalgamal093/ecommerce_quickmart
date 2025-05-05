import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class PriceInfo extends StatelessWidget {
  final String totalPrice;
  final num discount;
  const PriceInfo(
      {super.key, required this.totalPrice, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          'Order Info',
          style: context.titleLarge!.copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub Total',
              style: context.bodySmall,
            ),
            Text(
              '\$$totalPrice',
              style: context.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Cost',
              style: context.bodySmall,
            ),
            Text(
              '\$0.00',
              style: context.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        discount > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount',
                    style: context.bodySmall!
                        .copyWith(color: ColorsManager.subGreen),
                  ),
                  Text(
                    '- ${discount.toString()}',
                    style: context.bodySmall!
                        .copyWith(color: ColorsManager.subGreen),
                  )
                ],
              )
            : SizedBox(),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: context.titleLarge!.copyWith(fontSize: 16),
            ),
            Text(
              '\$$totalPrice',
              style: context.titleLarge!.copyWith(fontSize: 16),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
