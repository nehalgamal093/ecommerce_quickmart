import 'package:ecommerce_shop/models/product_model.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/product_details/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  const ProductItem({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetails.routeName,arguments: productModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(productModel.image),
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
            productModel.name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
          ),
          Text(
            productModel.price,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
          ),
          Text(
            productModel.priceAfterDiscount,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorsManager.lightGreyColor,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.lineThrough,
                decorationColor: ColorsManager.lightGreyColor),
          )
        ],
      ),
    );
  }
}
