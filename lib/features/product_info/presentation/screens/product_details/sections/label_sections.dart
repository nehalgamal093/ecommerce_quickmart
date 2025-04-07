import 'package:flutter/material.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/widgets/label_container.dart';

class LabelSections extends StatelessWidget {
  const LabelSections({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        LabelContainer(
            text: 'Top Rated',
            color: ColorsManager.subBlue),
        SizedBox(
          width: 5,
        ),
        LabelContainer(
            text: 'Free shipping',
            color: ColorsManager.subGreen),
      ],
    );
  }
}
