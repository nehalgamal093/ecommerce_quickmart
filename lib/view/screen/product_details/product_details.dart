import 'package:ecommerce_shop/models/product_model.dart';
import 'package:ecommerce_shop/view/common_widgets/label_container.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/product_details/sections/label_sections.dart';
import 'package:ecommerce_shop/view/screen/product_details/sections/product_price_title.dart';
import 'package:ecommerce_shop/view/screen/product_details/sections/rating_bar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = '/product_details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 700,
                      child: Image.asset(
                        productModel.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              LabelSection(),
                              SizedBox(
                                height: 10,
                              ),
                              ProductPriceTitle(
                                  name: productModel.name,
                                  price: productModel.price,
                                  priceAfterDiscount:
                                      productModel.priceAfterDiscount),
                              ProductRatingBar(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for... Read more',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Color'),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorsManager.subBlue,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: ColorsManager.greyColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: ColorsManager.blueColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: ColorsManager.blackColor,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Quantity'),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            ColorsManager.veryLightGreyColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('-'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('1'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('+'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
