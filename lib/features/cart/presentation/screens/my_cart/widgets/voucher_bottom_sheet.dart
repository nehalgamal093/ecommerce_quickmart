import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/core/widgets/custom_textfield_widget.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> showVoucherBottomSheet(BuildContext context){
  return showModalBottomSheet(context: context, builder: (context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: size.height*.30,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32,),
            Text('Voucher Code',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w700,color: ColorsManager.blackColor),),
            SizedBox(height: 16,),
            CustomTextFieldWidget(hintText: 'Enter Voucher Code',),
            SizedBox(height: 24,),
            CustomBtnWidget(title: 'Apply',onPressed: (){},),
            SizedBox(height: 8,),
          ],
        )
      ),
    );
  });
}