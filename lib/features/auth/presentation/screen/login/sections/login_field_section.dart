import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/view/common_widgets/custom_text_field.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';


class LoginFieldSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginFieldSection({super.key,required this.emailController,required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(label: 'Email'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: emailController,
          hintText: StringsManager.enterEmail,
        ),
        SizedBox(
          height: 16,
        ),
        LabelText(label: 'Password'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          controller: passwordController,
          hintText: StringsManager.enterPassword,
          icon: ImageIcon(
            AssetImage(
              ImagesManager.eyeIcon,
            ),
            color: ColorsManager.blackColor,
          ),
        ),
      ],
    );
  }
}
