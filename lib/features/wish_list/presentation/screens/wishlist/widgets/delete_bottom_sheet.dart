import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../../view/screen/on_boarding/widgets/custom_button.dart';

Future<dynamic> showDeleteBottomSheet(BuildContext context, String id,int index) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;

          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                color: ColorsManager.whiteColor,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: size.height * .30,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Delete product from cart',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.blackColor),
                    ),
                    CustomBtnWidget(
                      title: 'Delete',
                      count: '(1)',
                      subTitle: 'product',
                      onPressed: () {
//                         context.read<MyCartBloc>().add(DeleteItem(index,id));
//                         // cartItems.removeLast();
// Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: 'Cancel',
                      color: ColorsManager.whiteColor,
                      borderColor: ColorsManager.veryLightGreyColor,
                      textColor: ColorsManager.blackColor,
                    ),
                  ],
                )),
          );

      });
}
