import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';

class ReviewBarSection extends StatelessWidget {
  const ReviewBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringsManager.reviews,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          StringsManager.rate,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 10,
        ),
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
          height: 10,
        ),
        Text(
          StringsManager.baseOn12Review,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(StringsManager.excellent),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: LinearProgressIndicator(
                  color: ColorsManager.subGreen,
                  value: 20 / 50,
                  backgroundColor: ColorsManager.veryLightGreyColor),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(StringsManager.good),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: LinearProgressIndicator(
                  color: ColorsManager.blueColor,
                  value: 30 / 50,
                  backgroundColor: ColorsManager.veryLightGreyColor),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(StringsManager.average),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: LinearProgressIndicator(
                  color: ColorsManager.greyColor,
                  value: 20 / 50,
                  backgroundColor: ColorsManager.veryLightGreyColor),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(StringsManager.belowAverage),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: LinearProgressIndicator(
                  color: ColorsManager.redAccentColor,
                  value: 10 / 50,
                  backgroundColor: ColorsManager.veryLightGreyColor),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(StringsManager.poor),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: LinearProgressIndicator(
                  color: ColorsManager.redColor,
                  value: 5 / 50,
                  backgroundColor: ColorsManager.veryLightGreyColor),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
