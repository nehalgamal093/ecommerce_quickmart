import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_dialog.dart';
import 'package:ecommerce_shop/core/widgets/response_dialog.dart';
import 'package:ecommerce_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/sections/login_field_section.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/sections/privacy_policy_section.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/sign_up/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../core/widgets/header_text.dart';
import '../../../../main/presentation/screens/main_screen.dart';
import '../../../../on_boarding/widgets/custom_button.dart';
import '../../provider/validate_provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/auth';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var validationProvider = Provider.of<ValidateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Signup.routeName);
                      },
                      child: HeaderText(
                        title: StringsManager.login,
                        text: StringsManager.dontHaveAccount,
                        span: StringsManager.signup,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    LoginFieldSection(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
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
                        onPressed: validationProvider.isValid
                            ? () {
                                BlocProvider.of<AuthBloc>(context).add(
                                    OnLoginEvent(emailController.text,
                                        passwordController.text));
                              }
                            : null,
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
                    SizedBox(
                      height: 150,
                    ),
                    PrivacyPolicySection(),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          );
        }, listener: (context, state) {
          if (state.loginRequestState == RequestState.loading) {
            loadingDialog(context);
          } else if (state.loginRequestState == RequestState.error) {
            Navigator.pop(context);
            responseDialog(
                context, 'Login', state.failures!.message ?? "", false);
          } else if (state.loginRequestState == RequestState.success) {
            Navigator.pop(context);
            Navigator.pushNamed(context, MainScreen.routeName);
          }
        }),
      ),
    );
  }
}
