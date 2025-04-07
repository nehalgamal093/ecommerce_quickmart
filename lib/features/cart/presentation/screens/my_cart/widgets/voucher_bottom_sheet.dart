import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../bloc/my_cart_bloc.dart';

Future<dynamic> showVoucherBottomSheet(
    BuildContext context, TextEditingController controller, MyCartBloc bloc) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
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
                    'Voucher Code',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.blackColor),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFieldWidget(
                    hintText: 'Enter Voucher Code',
                    controller: controller,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomBtnWidget(
                    title: 'Apply',
                    onPressed: () {
                      bloc.add(ApplyCoupon(controller.text));
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              )),
        );
      });
}
