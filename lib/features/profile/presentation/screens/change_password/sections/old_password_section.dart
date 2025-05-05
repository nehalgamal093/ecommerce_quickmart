import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../../core/widgets/label_text.dart';
import '../../../../../auth/presentation/provider/obscure_password_provider.dart';
import '../../../provider/old_new_screen.dart';

class OldPasswordSection extends StatefulWidget {
  const OldPasswordSection({super.key});

  @override
  State<OldPasswordSection> createState() => _OldPasswordSectionState();
}

class _OldPasswordSectionState extends State<OldPasswordSection> {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var isObscure = Provider.of<ObscurePasswordProvider>(context);

    var provider = Provider.of<OldNewScreen>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            StringsManager.oldPassword,
            style: context.titleLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            StringsManager.enterOldToChangePassword,
            style: context.bodySmall,
          ),
          SizedBox(
            height: 20,
          ),
          LabelText(label: StringsManager.password),
          SizedBox(
            height: 5,
          ),
          CustomTextFieldWidget(
            hintText: StringsManager.enterPassword,
            controller: passwordController,
            icon: InkWell(
              onTap: () {
                isObscure.changeOldSecurePassword();
              },
              child: isObscure.isOldSecured
                  ? Icon(Icons.visibility_off)
                  : ImageIcon(
                      AssetImage(
                        ImagesManager.eyeIcon,
                      ),
                      color: ColorsManager.blackColor,
                    ),
            ),
            isObscure: isObscure.isOldSecured,
          ),
          SizedBox(
            height: 30,
          ),
          CustomBtnWidget(
              title: StringsManager.save,
              onPressed: () {
                provider.changeScreen(1);
              })
        ],
      ),
    );
  }
}
