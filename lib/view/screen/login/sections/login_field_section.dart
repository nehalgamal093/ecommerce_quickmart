import 'package:flutter/material.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../resources/assets_manager/images_manager.dart';
import '../../../resources/colors/colors_manager.dart';
import '../../../resources/strings_manager.dart';
import '../label_text.dart';

class LoginFieldSection extends StatelessWidget {
  const LoginFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(label: 'Email'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
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
