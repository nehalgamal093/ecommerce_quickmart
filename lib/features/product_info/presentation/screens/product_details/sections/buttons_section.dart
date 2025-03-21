import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../../../view/resources/colors/colors_manager.dart';


class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: CustomBtnWidget(
            title: 'Buy Now',
            onPressed: () {},
            textColor: ColorsManager.blackColor,
            backgroundColor: ColorsManager.whiteColor,
          ),),
        SizedBox(width: 10,),
        Expanded(
            child: CustomBtnWidget(
                title: 'Add to cart',
                onPressed: () {}))
      ],
    );
  }
}
