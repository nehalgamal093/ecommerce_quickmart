import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

import '../../features/wish_list/presentation/screens/wishlist/widgets/delete_bottom_sheet.dart';


class ProductTileWidget extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String price;
  final String priceAfterDiscount;
  final bool isWishlist;
final String id;
final VoidCallback onTap;
  const ProductTileWidget(
      {super.key,
      this.isWishlist = false,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.priceAfterDiscount,
        required this.id,
        required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      height: size.height * .20,
      width: size.width,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .40,
            child: ClipRRect(
              child: Image.network(image),
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
                        description,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              letterSpacing: .5,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .10,
                      child: isWishlist
                          ? SizedBox()
                          : Checkbox(
                              value: true,
                              onChanged: (val) {},
                              activeColor: ColorsManager.cyanColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  priceAfterDiscount,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        border:
                            Border.all(color: ColorsManager.veryLightGreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isWishlist
                              ? TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: ColorsManager.lightGreyColor),
                                  ))
                              : TextButton(onPressed: () {}, child: Text('-')),
                          isWishlist
                              ? Text(
                                  '2',
                                  style: TextStyle(
                                      color: ColorsManager.lightGreyColor),
                                )
                              : Text('2'),
                          isWishlist
                              ? TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: ColorsManager.lightGreyColor),
                                  ))
                              : TextButton(onPressed: () {}, child: Text('+')),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: size.width * .10,
                      child: InkWell(
                        onTap:onTap,
                        child: Image.asset(
                          ImagesManager.trash,
                          width: 20,
                        ),
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
    );
  }
}
