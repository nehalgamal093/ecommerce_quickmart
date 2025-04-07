import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class PriceInfo extends StatelessWidget {
  final String totalPrice;
  final num discount;
  const PriceInfo({super.key,required this.totalPrice,required this.discount});

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
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub Total',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '\$$totalPrice',
              style: Theme.of(context).textTheme.bodySmall,
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
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '\$0.00',
              style: Theme.of(context).textTheme.bodySmall,
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
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorsManager.subGreen),
            ),
            Text(
              '- ${discount.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
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
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16),
            ),
            Text(
              '\$$totalPrice',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16),
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
