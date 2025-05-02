import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../cart/presentation/bloc/my_cart_bloc.dart';
import '../../../../../on_boarding/widgets/custom_button.dart';

Future<dynamic> showDeleteBottomSheet(
    BuildContext context, String id, int index, MyCartBloc bloc) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;

        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  StringsManager.deleteProductFromCart,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.blackColor),
                ),
                SizedBox(
                  height: 24,
                ),
                CustomBtnWidget(
                  title: StringsManager.delete,
                  count: '(1)',
                  subTitle: StringsManager.product,
                  onPressed: () {
                    bloc.add(DeleteItem(index, id));
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: StringsManager.cancel,
                  color: ColorsManager.whiteColor,
                  borderColor: ColorsManager.veryLightGreyColor,
                  textColor: ColorsManager.blackColor,
                ),
              ],
            ),
          ),
        );
      });
}
