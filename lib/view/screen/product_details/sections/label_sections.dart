import 'package:flutter/material.dart';
import '../../../common_widgets/label_container.dart';
import '../../../resources/colors/colors_manager.dart';

class LabelSection extends StatelessWidget {
  const LabelSection({super.key});

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
