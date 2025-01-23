import 'package:ecommerce_shop/models/onboarding_item.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/get_started_button.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/item_header.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/next_button.dart';
import 'package:flutter/material.dart';
import '../../../resources/colors/colors_manager.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemModel item;
  final int index;
  final Function()? onPressed;
  const OnBoardingItem(
      {super.key,
      required this.item,
      required this.onPressed,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: ColorsManager.lightCyanColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [ItemHeader(), Image.asset(item.image)],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            item.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          index == OnBoardingItemModel.getLength - 1
              ? GetStartedButton()
              : NextButton(
                  onPressed: onPressed,
                )
        ],
      ),
    );
  }
}
