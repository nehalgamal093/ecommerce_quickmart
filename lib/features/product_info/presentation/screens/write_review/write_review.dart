import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_dialog.dart';
import 'package:ecommerce_shop/core/widgets/response_dialog.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/product_details.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/write_review/sections/product_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/write_review/sections/write_review_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/constants/strings_manager.dart';
import '../../../data/model/product_details_model.dart';

class WriteReview extends StatefulWidget {
  static const String routeName = '/write_review';
  const WriteReview({super.key});

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductDetailsModel productDetails =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.writeReview),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<ProductInfoBloc, ProductsInfoState>(
              builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ProductSection(
                  product: productDetails.result!,
                ),
                SizedBox(
                  height: 100,
                ),
                WriteReviewField(
                  textEditingController: reviewController,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomBtnWidget(
                    title: StringsManager.writeReview,
                    onPressed: () {
                      ReviewRequestModel review = ReviewRequestModel(
                          ratings: 3,
                          comment: reviewController.text,
                          product: productDetails.result?.id);
                      BlocProvider.of<ProductInfoBloc>(context).add(
                        WriteReviewEvent(review),
                      );
                    })
              ],
            );
          }, listener: (context, state) {
            if (state.writingReviewRequestState ==
                ProductsInfoRequestState.loading) {
              loadingDialog(context);
            } else if (state.writingReviewRequestState ==
                ProductsInfoRequestState.error) {
              Navigator.pop(context);
              responseDialog(context, StringsManager.writeReview,
                  state.failures!.message!, false);
            } else if (state.writingReviewRequestState ==
                ProductsInfoRequestState.success) {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProductDetails.routeName,
                  arguments: productDetails.result?.id);
            }
          }),
        ),
      ),
    );
  }
}
