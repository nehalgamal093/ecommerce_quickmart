import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';

class QuantitySection extends StatelessWidget {
  const QuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text('Quantity'),
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                  ColorsManager.veryLightGreyColor)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('-'),
                SizedBox(
                  width: 10,
                ),
                Text('1'),
                SizedBox(
                  width: 10,
                ),
                Text('+'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
