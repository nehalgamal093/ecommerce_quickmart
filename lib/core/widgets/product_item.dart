import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/features/products/presentation/widgets/like_btn.dart';
import 'package:flutter/material.dart';

import '../resources/colors/colors_manager.dart';

class ProductItem extends StatelessWidget {
  final Result productModel;
  const ProductItem({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LikeBtn(id: productModel.id!,),
          ],
        ),
        Expanded(child: Image.network(productModel.images![0].attachmentFile!)),

        SizedBox(
          height: 5,
        ),
        Text(
          productModel.title!,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
        ),
        Text(
          productModel.price.toString(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
        ),
        Text(
          productModel.priceAfterDiscount.toString(),
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
