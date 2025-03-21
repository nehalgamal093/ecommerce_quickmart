import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/buttons_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/product_info_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/product_reviews_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/review_bar_section.dart';
import 'package:ecommerce_shop/features/products/data/models/products.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

import '../write_review/write_review.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = '/product_details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Result productModel = ModalRoute.of(context)?.settings.arguments as Result;
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: ProductInfoSection(productModel: productModel),
          ),
          SliverToBoxAdapter(
            child: ButtonsSection(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: ReviewBarSection(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: ColorsManager.lightGreyColor,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          ProductReviewsSection(id: productModel.id!,),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomBtnWidget(
                title: 'Write A Review',
                onPressed: () {
                  Navigator.pushNamed(context, WriteReview.routeName,arguments: productModel);
                }),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ]),
      ),
    );
  }
}
