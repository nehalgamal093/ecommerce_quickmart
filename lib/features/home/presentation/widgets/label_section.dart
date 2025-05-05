import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/colors/colors_manager.dart';
import '../../../../core/resources/constants/strings_manager.dart';

class LabelSection extends StatelessWidget {
  final String label;
  const LabelSection({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.titleLarge!.copyWith(fontSize: 18),
        ),
        Text(
          StringsManager.seeAll,
          style: context.displaySmall!.copyWith(
              color: ColorsManager.cyanColor, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
