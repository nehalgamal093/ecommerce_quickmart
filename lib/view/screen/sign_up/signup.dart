import 'package:ecommerce_shop/view/common_widgets/custom_text_field.dart';
import 'package:ecommerce_shop/view/common_widgets/header_text.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager/images_manager.dart';
import '../../resources/colors/colors_manager.dart';

class Signup extends StatelessWidget {
  static const String routeName = '/signup';
  const Signup({super.key});

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
            HeaderText(title: StringsManager.signup, text: StringsManager.alreadyHaveAccount, span: StringsManager.login),
            SizedBox(
              height: 32,
            ),
            LabelText(label: StringsManager.fullName),
            SizedBox(
              height: 5,
            ),
            CustomTextField(hintText: StringsManager.enterFullName),
            SizedBox(
              height: 16,
            ),
            LabelText(label: StringsManager.email),
            SizedBox(
              height: 5,
            ),
            CustomTextField(hintText: StringsManager.enterEmail),
            SizedBox(
              height: 16,
            ),
            LabelText(label: StringsManager.password),
            SizedBox(
              height: 5,
            ),
            CustomTextField(hintText: StringsManager.enterPassword),
            SizedBox(
              height: 24,
            ),
            CustomButton(onPressed: (){}, title: StringsManager.createAccount, color: Colors.black),
            SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: () {},
              textColor: Colors.black,
              title: StringsManager.signupGoogle,
              color: ColorsManager.whiteColor,
              borderColor: ColorsManager.veryLightGreyColor,
              icon: ImageIcon(
                AssetImage(ImagesManager.googleIcon),
                color: ColorsManager.cyanColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
