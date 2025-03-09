import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      decoration: BoxDecoration(color: ColorsManager.cyanColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImagesManager.avatar,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nehal Gamal'),
              Text('nehalgamal@gmail.com'),
            ],
          ),
          Spacer(),
          Image.asset(ImagesManager.logout)
        ],
      ),
    );
  }
}
