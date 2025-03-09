import 'package:ecommerce_shop/view/change_password/change_password.dart';
import 'package:ecommerce_shop/view/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/view/screen/payment_method/payment_method.dart';
import 'package:ecommerce_shop/view/screen/profile/sections/header_section.dart';
import 'package:ecommerce_shop/view/screen/profile/widgets/title_icon_widget.dart';
import 'package:ecommerce_shop/view/shipping_address/shipping_address.dart';
import 'package:flutter/material.dart';

import '../../faq/faq.dart';
import '../../resources/colors/colors_manager.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderSection(),
          SizedBox(
            height: 30,
          ),
          Container(
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
                Text('Personal Information'),
                SizedBox(
                  height: 20,
                ),
                TitleIconWidget(
                  icon: ImagesManager.box,
                  title: 'Shipping Address',
                  onPressed: () {
                    Navigator.pushNamed(context, ShippingAddress.routeName);
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
                  title: 'Payment Method',
                  onPressed: () {
                    Navigator.pushNamed(context, PaymentMethod.routeName);
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
                  title: 'Order History',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Support & Information'),
                SizedBox(
                  height: 20,
                ),
                TitleIconWidget(
                  icon: ImagesManager.privacyPolicy,
                  title: 'Privacy Policy',
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
                  title: 'Terms & Conditions',
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
                  title: 'FAQ',
                  onPressed: () {
                    Navigator.pushNamed(context, FAQ.routeName);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Account Management'),
                SizedBox(
                  height: 20,
                ),
                TitleIconWidget(
                  icon: ImagesManager.changePassword,
                  title: 'Change Password',
                  onPressed: () {
                    Navigator.pushNamed(context, ChangePassword.routeName);
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
                  title: 'Dark Theme',
                  onPressed: () {},
                  widget: Switch(
                    value: false,
                    onChanged: (val) {},
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: ColorsManager.veryLightGreyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
