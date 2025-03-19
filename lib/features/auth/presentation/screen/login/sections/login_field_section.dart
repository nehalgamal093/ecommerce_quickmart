import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/provider/validate_provider.dart';
import 'package:ecommerce_shop/view/common_widgets/custom_text_field.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFieldSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFieldSection(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoginFieldSection> createState() => _LoginFieldSectionState();
}

class _LoginFieldSectionState extends State<LoginFieldSection> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var validationProvider = Provider.of<ValidateProvider>(context);

    return Column(
      children: [
        LabelText(label: 'Email'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          errorText: validationProvider.errorEmailText,
          onChanged: (val) {
          validationProvider.validateEmail(val);
          },
          controller: widget.emailController,
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
          errorText: validationProvider.errorPasswordText,
          onChanged: (val) {
            validationProvider.validatePassword(val);
          },
          controller: widget.passwordController,
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
