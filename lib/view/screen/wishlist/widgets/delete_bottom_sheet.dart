import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import '../../on_boarding/widgets/custom_button.dart';

Future<dynamic> showDeleteBottomSheet(BuildContext context){
  return showModalBottomSheet(context: context, builder: (context){
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: ColorsManager.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: size.height*.30,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32,),
              Text('Delete product from wishlist',style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16,fontWeight: FontWeight.w700,color: ColorsManager.blackColor),),

              SizedBox(height: 24,),
              CustomBtnWidget(title: 'Delete',count: '(1)',subTitle: 'product',onPressed: (){},),
              SizedBox(height: 8,),
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
          )
      ),
    );
  });
}