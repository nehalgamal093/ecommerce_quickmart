import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';

class OrderSuccess extends StatelessWidget {
  static const String routeName = "/order_success";
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * .6,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightCyanColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Image.asset(ImagesManager.onlineShopping),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  StringsManager.orderPlacedSuccessfully,
                  style: context.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  StringsManager.thankYouForChoosingUs,
                  style: context.bodySmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomBtnWidget(
                    title: StringsManager.continueShopping,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
