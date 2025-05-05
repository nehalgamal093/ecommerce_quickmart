import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';

class Ongoing extends StatelessWidget {
  const Ongoing({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          ImagesManager.orderHistory,
          fit: BoxFit.cover,
          height: size.height * .5,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          StringsManager.noOngoingOrder,
          style: context.titleLarge,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          StringsManager.weDontHaveActiveOrders,
          style: context.bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 25,
        ),
        CustomBtnWidget(
            title: StringsManager.exploreCategories, onPressed: () {})
      ],
    );
  }
}
