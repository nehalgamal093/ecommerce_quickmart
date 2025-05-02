import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          itemSize: 20,
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
          width: 10,
        ),
        Text(StringsManager.reviewsCount),
      ],
    );
  }
}
