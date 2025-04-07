import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/sign_up/signup.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/assets_manager/images_manager.dart';
import '../../../core/resources/colors/colors_manager.dart';
import 'custom_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            title: 'Login',
            color: ColorsManager.whiteColor,
            borderColor: ColorsManager.veryLightGreyColor,
            textColor: ColorsManager.blackColor,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Signup.routeName);
            },
            title: 'Get Started',
            color: ColorsManager.blackColor,
            icon: ImageIcon(AssetImage(ImagesManager.arrowIcon),
                color: ColorsManager.whiteColor),
          ),
        ),
      ],
    );
  }
}
