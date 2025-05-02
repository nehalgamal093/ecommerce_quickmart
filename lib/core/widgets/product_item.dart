import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/presentation/widgets/like_btn.dart';
import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class ProductItem extends StatelessWidget {
  final Result productModel;

  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: ColorsManager.veryLightGreyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LikeBtn(
                  id: productModel.id!,
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                productModel.images![0].attachmentFile!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              productModel.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  productModel.priceAfterDiscount.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsManager.blackColor,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Text(
                  productModel.price.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsManager.lightGreyColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: ColorsManager.lightGreyColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
