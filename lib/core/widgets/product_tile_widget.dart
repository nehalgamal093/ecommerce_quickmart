import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/screen/wishlist/widgets/delete_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final bool isWishlist;
  const ProductTileWidget({super.key, this.isWishlist = false});

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
                        'Loop Silicone Strong Magnetic Watch',
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
                  '\$15.25',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$20.00',
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
                        onTap: (){
                          showDeleteBottomSheet(context);
                        },
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
