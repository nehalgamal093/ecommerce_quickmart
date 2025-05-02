import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/colors_manager.dart';

class LoadingProductInfo extends StatelessWidget {
  const LoadingProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.height * .6,
              decoration: BoxDecoration(
                color: ColorsManager.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * .7,
              height: size.height * .05,
              decoration: BoxDecoration(
                color: ColorsManager.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * .5,
              height: size.height * .05,
              decoration: BoxDecoration(
                color: ColorsManager.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * .6,
              height: size.height * .05,
              decoration: BoxDecoration(
                color: ColorsManager.veryLightGreyColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
