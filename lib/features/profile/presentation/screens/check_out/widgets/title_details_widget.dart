import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class TitleDetailsWidget extends StatelessWidget {
  final String title;
  final String details;
  const TitleDetailsWidget(
      {super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: context.bodySmall!.copyWith(
                fontWeight: FontWeight.w500, color: ColorsManager.greyColor),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            maxLines: 2,
            details,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall!.copyWith(
                fontWeight: FontWeight.w500, color: ColorsManager.greyColor),
          ),
        )
      ],
    );
  }
}
