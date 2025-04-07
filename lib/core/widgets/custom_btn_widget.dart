import 'package:flutter/material.dart';
import '../resources/colors/colors_manager.dart';

class CustomBtnWidget extends StatelessWidget {
  final String title;
  final String count;
  final String subTitle;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  const CustomBtnWidget(
      {super.key, required this.title, this.count = "", this.subTitle = "",required this.onPressed,this.backgroundColor= ColorsManager.blackColor,this.textColor =ColorsManager.whiteColor});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height:isPortrait? size.height * .08:size.height * .1,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: textColor, fontSize: 14),),
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
