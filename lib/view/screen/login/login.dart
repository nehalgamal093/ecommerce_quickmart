import 'package:ecommerce_shop/view/common_widgets/custom_text_field.dart';
import 'package:ecommerce_shop/view/common_widgets/header_text.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/home.dart';
import 'package:ecommerce_shop/view/screen/login/sections/login_field_section.dart';
import 'package:ecommerce_shop/view/screen/login/sections/privacy_policy_section.dart';
import 'package:ecommerce_shop/view/screen/main/main_screen.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/custom_button.dart';
import 'package:ecommerce_shop/view/screen/login/label_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            HeaderText(
              title: StringsManager.login,
              text: StringsManager.dontHaveAccount,
              span: StringsManager.signup,
            ),
            SizedBox(
              height: 32,
            ),
            LoginFieldSection(),
            SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                StringsManager.forgetPassword,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorsManager.cyanColor),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MainScreen.routeName);
                },
                title: StringsManager.login,
                color: ColorsManager.blackColor),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () {},
              textColor: Colors.black,
              title: StringsManager.loginGoogle,
              color: ColorsManager.whiteColor,
              borderColor: ColorsManager.veryLightGreyColor,
              icon: ImageIcon(
                AssetImage(ImagesManager.googleIcon),
                color: ColorsManager.cyanColor,
              ),
            ),
            Spacer(),
            PrivacyPolicySection(),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
