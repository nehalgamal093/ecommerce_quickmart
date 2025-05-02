import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/label_container.dart';

class LabelSections extends StatelessWidget {
  const LabelSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelContainer(
            text: StringsManager.topRated, color: ColorsManager.subBlue),
        SizedBox(
          width: 5,
        ),
        LabelContainer(
            text: StringsManager.freeShipping, color: ColorsManager.subGreen),
      ],
    );
  }
}
