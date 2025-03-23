import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_dialog.dart';
import 'package:ecommerce_shop/core/widgets/response_dialog.dart';
import 'package:ecommerce_shop/features/product_info/data/model/product_details_model.dart';
import 'package:ecommerce_shop/features/product_info/data/model/review_request_model.dart';
import 'package:ecommerce_shop/features/product_info/presentation/bloc/product_info_bloc.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/product_details/product_details.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/write_review/sections/product_section.dart';
import 'package:ecommerce_shop/features/product_info/presentation/screens/write_review/sections/write_review_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Result productDetails = ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
      appBar: AppBar(
        title: Text('Write a review'),
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
                  product: productDetails,
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
                    title: 'Write Review',
                    onPressed: () {
                      ReviewRequestModel review = ReviewRequestModel(
                          ratings: 3,
                          comment: reviewController.text,
                          product: productDetails.id);
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
              responseDialog(
                  context, 'Write Review', state.failures!.message!, false);
            } else if (state.writingReviewRequestState ==
                ProductsInfoRequestState.success) {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProductDetails.routeName,arguments: productDetails.id);
        
            }
          }),
        ),
      ),
    );
  }
}
