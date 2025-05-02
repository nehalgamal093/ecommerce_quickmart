import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../data/model/product_details_model.dart';

class ProductReviewsSection extends StatelessWidget {
  final Result result;
  const ProductReviewsSection({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 250, minHeight: 10),
          child: result.myReviews!.isEmpty
              ? SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(getLength(result.myReviews!.length),
                      (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.myReviews![index].user!.name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 14,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: ColorsManager.veryLightGreyColor,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          result.myReviews![index].comment!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
                )),
    );
  }

  int getLength(int index) {
    if (index > 5) {
      return 5;
    } else {
      return index;
    }
  }
}
