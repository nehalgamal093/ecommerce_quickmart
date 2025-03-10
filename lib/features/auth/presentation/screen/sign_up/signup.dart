import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/features/auth/data/models/register_request_model.dart';
import 'package:ecommerce_shop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_shop/features/auth/presentation/screen/login/login.dart';
import 'package:ecommerce_shop/view/common_widgets/custom_text_field.dart';
import 'package:ecommerce_shop/view/common_widgets/header_text.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/core/widgets/label_text.dart';
import 'package:ecommerce_shop/view/screen/on_boarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '../../../../../core/widgets/response_dialog.dart';

class Signup extends StatefulWidget {
  static const String routeName = '/signup';

  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

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
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
            child: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: HeaderText(
                          title: StringsManager.signup,
                          text: StringsManager.alreadyHaveAccount,
                          span: StringsManager.login),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    LabelText(label: StringsManager.fullName),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: fullNameController,
                        hintText: StringsManager.enterFullName),
                    SizedBox(
                      height: 16,
                    ),
                    LabelText(label: StringsManager.email),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: emailController,
                        hintText: StringsManager.enterEmail),
                    SizedBox(
                      height: 16,
                    ),
                    LabelText(label: StringsManager.password),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: passwordController,
                        hintText: StringsManager.enterPassword),
                    SizedBox(
                      height: 16,
                    ),
                    LabelText(label: 'Phone'),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                        controller: phoneController,
                        hintText: 'Enter your phone'),
                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                        onPressed: () {
                          RegisterRequestModel model = RegisterRequestModel(
                              name: fullNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text);
                          if(formKey.currentState!.validate()){
                            BlocProvider.of<AuthBloc>(context)
                                .add(OnRegisterEvent(model));
                          }
                        },
                        title: StringsManager.createAccount,
                        color: Colors.black),
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
              );
            }, listener: (context, state) {
              if (state.registerRequestState == RequestState.loading) {
                loadingDialog(context);
              } else if (state.registerRequestState == RequestState.error) {
                Navigator.pop(context);
                responseDialog(
                    context, 'Register', state.failures!.message ?? "",false);
              } else if (state.registerRequestState == RequestState.success) {
                Navigator.pop(context);
                Navigator.pushNamed(context, LoginScreen.routeName);
              }
            }),
          ),
        ),
      ),
    );
  }
}
