import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/custom_btn_widget.dart';
import '../../../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../../../core/widgets/label_text.dart';
import '../../../../../auth/presentation/provider/obscure_password_provider.dart';
import '../../../bloc/profile_bloc/profile_bloc.dart';

class NewPasswordSection extends StatefulWidget {
  const NewPasswordSection({super.key});

  @override
  State<NewPasswordSection> createState() => _NewPasswordSectionState();
}

class _NewPasswordSectionState extends State<NewPasswordSection> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isObscure = Provider.of<ObscurePasswordProvider>(context);

    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<ProfileBloc>(),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.changePasswordState == ChangePasswordState.success) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return logoutDialog(context);
                  });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'New Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Enter your new password and remember it',
                      style: Theme.of(context).textTheme.bodySmall,
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
                      isObscure: isObscure.isNewSecured,
                      icon: InkWell(
                        onTap: () {
                          isObscure.changeNewSecurePassword();
                        },
                        child: isObscure.isNewSecured
                            ? Icon(Icons.visibility_off)
                            : ImageIcon(
                                AssetImage(
                                  ImagesManager.eyeIcon,
                                ),
                                color: ColorsManager.blackColor,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LabelText(label: StringsManager.confirmPassword),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextFieldWidget(
                      hintText: StringsManager.enterPassword,
                      controller: confirmPasswordController,
                      isObscure: isObscure.isConfirmSecured,
                      icon: InkWell(
                        onTap: () {
                          isObscure.changeSecureConfirmPassword();
                        },
                        child: isObscure.isConfirmSecured
                            ? Icon(Icons.visibility_off)
                            : ImageIcon(
                                AssetImage(
                                  ImagesManager.eyeIcon,
                                ),
                                color: ColorsManager.blackColor,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomBtnWidget(
                        title: StringsManager.continueProcess,
                        onPressed: () {
                          context.read<ProfileBloc>().add(ChangePasswordEvent(
                              confirmPasswordController.text));
                          // provider.changeScreen(0);
                        })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
