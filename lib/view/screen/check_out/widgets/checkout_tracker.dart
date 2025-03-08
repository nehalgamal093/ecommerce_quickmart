import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/check_out/widgets/tracker_item.dart';
import 'package:flutter/material.dart';

class CheckoutTracker extends StatelessWidget {
  final int currIndex;
  const CheckoutTracker({super.key,required this.currIndex});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Row(
        children: [
          TrackerItem(
            image: ImagesManager.box,
            activeImage: ImagesManager.activeBox,
            title: 'Shipping',
            color: changeColorOfItem(0,currIndex),
          ),
          Expanded(
            child: Divider(
              endIndent: 10,
              indent: 10,
              color: ColorsManager.lightGreyColor,
              thickness: 1,
            ),
          ),
          TrackerItem(
            image: ImagesManager.cardTick,
            activeImage: ImagesManager.activeCardTick,
            title: 'Payment',
            color: changeColorOfItem(1, currIndex),
          ),
          Expanded(
            child: Divider(
              endIndent: 10,
              indent: 10,
              color: ColorsManager.lightGreyColor,
              thickness: 1,
            ),
          ),
          TrackerItem(
            image: ImagesManager.clipboardTick,
            activeImage: '',
            title: 'Review',
            color: changeColorOfItem(2, currIndex),
          ),
        ],
      ),
    );
  }

  Color changeColorOfItem(int index, int currIndex) {
    if (index == currIndex) {
      return ColorsManager.blackColor;
    } else if (currIndex > index) {
      return ColorsManager.cyanColor;
    } else {
      return ColorsManager.lightGreyColor;
    }
  }
}
