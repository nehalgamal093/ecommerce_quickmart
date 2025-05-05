import 'package:ecommerce_shop/features/profile/presentation/screens/profile/sections/header_section.dart';
import 'package:ecommerce_shop/features/profile/presentation/screens/profile/widgets/title_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/logic/Animation/route_animation.dart';
import '../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../core/resources/constants/strings_manager.dart';
import '../change_password/change_password.dart';
import '../faq/faq.dart';
import '../order_history/order_history.dart';
import '../payment_method/payment_method.dart';
import '../shipping_address/shipping_address.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ProfileHeader(),
              SizedBox(
                height: 30,
              ),
              Container(
                height: isPortrait ? size.height * .9 : size.width * .65,
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorsManager.whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(StringsManager.personalInformation),
                    SizedBox(
                      height: 20,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.box,
                      title: StringsManager.shippingAddress,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(
                            ShippingAddress(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorsManager.veryLightGreyColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.cardTick,
                      title: StringsManager.paymentMethod,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(
                            PaymentMethod(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorsManager.veryLightGreyColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.clipboardTick,
                      title: StringsManager.orderHistory,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(
                            OrderHistory(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(StringsManager.supportAndInformation),
                    SizedBox(
                      height: 20,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.privacyPolicy,
                      title: StringsManager.privacyPolicy,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorsManager.veryLightGreyColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.document,
                      title: StringsManager.termsAndConditions,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorsManager.veryLightGreyColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.faq,
                      title: StringsManager.faq,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(
                            FAQ(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(StringsManager.accountManagement),
                    SizedBox(
                      height: 20,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.changePassword,
                      title: StringsManager.changePassword,
                      onPressed: () {
                        Navigator.of(context).push(
                          RouteAnimation.createRoute(
                            ChangePassword(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: ColorsManager.veryLightGreyColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TitleIconWidget(
                      icon: ImagesManager.document,
                      title: StringsManager.darkTheme,
                      onPressed: () {},
                      widget: Switch(
                        value: false,
                        onChanged: (val) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
