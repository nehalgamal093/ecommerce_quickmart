import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/product_price_title.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/quantity_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/rating_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../data/model/product_details_model.dart';
import 'colors_bar.dart';
import 'label_sections.dart';

class ProductInfoSection extends StatelessWidget {
  final Result productModel;
  const ProductInfoSection({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: isPortrait?size.height*.5:size.height*.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              productModel.images![0].attachmentFile!,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              LabelSections(),
              SizedBox(
                height: 10,
              ),
              ProductPriceTitle(
                  name: productModel.title!,
                  price: productModel.price.toString(),
                  priceAfterDiscount: productModel
                      .priceAfterDiscount
                      .toString()),
              ProductRatingBar(),
              SizedBox(
                height: 10,
              ),
              Text(
                productModel.description!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Color'),
              SizedBox(
                height: 5,
              ),
              ColorsBar(),
              SizedBox(
                height: 10,
              ),
              QuantitySection(),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ],
    );
  }
}
