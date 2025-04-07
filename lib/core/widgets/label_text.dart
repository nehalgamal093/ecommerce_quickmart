import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.blackColor, fontWeight: FontWeight.w700),
        ),
        Text(
          ' *',
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
