import 'package:ecommerce_shop/features/home/presentation/widgets/loading_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';

class LoadingHome extends StatelessWidget {
  const LoadingHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          width: double.infinity,
          height: size.height * .2,
          decoration: BoxDecoration(
            color: ColorsManager.veryLightGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: List.generate(isPortrait ? 10 : 15, (index) {
            if (index % 2 == 1) {
              return Container(
                height: isPortrait ? 60 : size.height * .2,
                width: isPortrait ? 60 : size.height * .2,
                color: ColorsManager.veryLightGreyColor,
              );
            } else {
              return SizedBox(width: isPortrait ? 15 : 20);
            }
          }),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingItem(),
            SizedBox(
              width: 10,
            ),
            LoadingItem(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingItem(),
            SizedBox(
              width: 10,
            ),
            LoadingItem(),
          ],
        )
      ])),
    );
  }
}
