import 'package:flutter/material.dart';

import '../../../resources/colors/colors_manager.dart';

class TitleDetailsWidget extends StatelessWidget {
  final String title;
  final String details;
  const TitleDetailsWidget({super.key,required this.title,required this.details});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500, color: ColorsManager.greyColor),
        ),
        Spacer(),
        Text(
          details,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500, color: ColorsManager.greyColor),
        )
      ],
    );
  }
}
