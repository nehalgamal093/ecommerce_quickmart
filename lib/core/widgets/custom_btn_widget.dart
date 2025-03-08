import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomBtnWidget extends StatelessWidget {
  final String title;
  final String count;
  final String subTitle;
  final VoidCallback onPressed;
  const CustomBtnWidget(
      {super.key, required this.title, this.count = "", this.subTitle = "",required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size.height * .08,
              decoration: BoxDecoration(
                color: ColorsManager.blackColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorsManager.whiteColor, fontSize: 14),),
                      SizedBox(width: 5,),
                      Text(count,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorsManager.whiteColor, fontSize: 14),),
                      SizedBox(width: 5,),
                      Text(subTitle,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: ColorsManager.whiteColor, fontSize: 14),),
                    ],
                  ),),
            ),
          ),
        ],
      ),
    );
  }
}
