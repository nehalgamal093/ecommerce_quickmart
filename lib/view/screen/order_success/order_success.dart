import 'package:ecommerce_shop/core/widgets/custom_btn_widget.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:flutter/material.dart';
import '../../resources/colors/colors_manager.dart';

class OrderSuccess extends StatelessWidget {
  static const String routeName = "/order_success";
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:size.height*.6 ,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: ColorsManager.lightCyanColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Image.asset(ImagesManager.onlineShopping),),
              SizedBox(height: 16,),
              Text('Your order has been placed successfully',style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              Text('Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              CustomBtnWidget(title: 'Continue Shopping', onPressed: (){}),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
