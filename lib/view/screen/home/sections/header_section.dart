import 'package:flutter/material.dart';
import '../../../resources/assets_manager/images_manager.dart';
import '../../../resources/colors/colors_manager.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(ImagesManager.header),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorsManager.blackColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Text(
                '30% OFF',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'On Headphones',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Exclusive Sales',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorsManager.whiteColor),
              ),
            ),
            SizedBox(height: 10)
          ],
        )
      ],
    );
  }
}
