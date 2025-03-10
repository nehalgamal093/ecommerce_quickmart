import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:flutter/material.dart';

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
          'No ongoing order',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'We currently don\'t have any active orders in progress. Feel free to explore our products and place a new order.',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 25,
        ),
        CustomBtnWidget(title: 'Explore Categories', onPressed: (){})
      ],
    );
  }
}
