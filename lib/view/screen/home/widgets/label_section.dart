import 'package:flutter/material.dart';
import '../../../resources/colors/colors_manager.dart';
import '../../../resources/strings_manager.dart';

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
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
        Text(
          StringsManager.seeAll,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: ColorsManager.cyanColor, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
