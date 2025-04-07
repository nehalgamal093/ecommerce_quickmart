import 'package:flutter/material.dart';
import '../../../core/models/onboarding_item.dart';
import '../../../core/resources/colors/colors_manager.dart';
import 'get_started_button.dart';
import 'item_header.dart';
import 'next_button.dart';

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
    Size size = MediaQuery.of(context).size;
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
              children: [
                ItemHeader(),
                Image.asset(item.image, height: size.height * .4)
              ],
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
