import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/buttons_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/product_info_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/product_reviews_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/sections/review_bar_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/widgets/loading_product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';
import '../write_review/write_review.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = '/product_details';
  final String id;
  const ProductDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.productDetails),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            getIt<ProductInfoBloc>()..add(GetProductInfoEvent(id)),
        child: BlocBuilder<ProductInfoBloc, ProductsInfoState>(
            builder: (context, state) {
          if (state.productDetailsRequestState ==
              ProductsInfoRequestState.loading) {
            return LoadingProductInfo();
          } else if (state.productDetailsRequestState ==
              ProductsInfoRequestState.error) {
            return Text(state.failures!.message!);
          } else if (state.productDetailsRequestState ==
              ProductsInfoRequestState.success) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: ProductInfoSection(
                      productModel: state.productDetailsModel!.result!),
                ),
                SliverToBoxAdapter(
                  child: ButtonsSection(
                    id: state.productDetailsModel!.result!.id!,
                  ),
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
                ProductReviewsSection(
                  result: state.productDetailsModel!.result!,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomBtnWidget(
                      title: StringsManager.writeReview,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(WriteReview(),
                              arguments: state.productDetailsModel!),
                        );
                        // Navigator.pushNamed(context, WriteReview.routeName,
                        //     arguments: state.productDetailsModel!.result!);
                      }),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
              ]),
            );
          } else {
            return SizedBox();
          }
        }),
      )),
    );
  }
}
