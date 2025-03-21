import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import '../../features/product_info/presentation/screens/product_details/product_details.dart';

class ProductItem extends StatelessWidget {
  final Result productModel;
  const ProductItem({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Image.network(productModel.images![0].attachmentFile!,width: size.width*.40,height: size.height*.20,),
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
      ),
    );
  }
}
