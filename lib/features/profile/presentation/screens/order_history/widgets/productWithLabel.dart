import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';

class ProductWithLabel extends StatelessWidget {
  const ProductWithLabel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      height: size.height * .25,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: ColorsManager.redAccentColor,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              StringsManager.estimatedTime,
              style: TextStyle(color: ColorsManager.whiteColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .40,
                child: ClipRRect(
                  child: Image.asset(
                    ImagesManager.product1,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            StringsManager.loopWatch,
                            style: context.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              letterSpacing: .5,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      StringsManager.price1,
                      style: context.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      StringsManager.price2,
                      style: context.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.lightGreyColor,
                        letterSpacing: .5,
                        decoration: TextDecoration.lineThrough,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorsManager.veryLightGreyColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: ColorsManager.lightGreyColor),
                                  )),
                              Text(
                                '2',
                                style: TextStyle(
                                    color: ColorsManager.lightGreyColor),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: ColorsManager.lightGreyColor),
                                ),
                              )
                            ],
                          ),
                        ),

                        // SizedBox(width: 15),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
