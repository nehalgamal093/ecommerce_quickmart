import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/assets_manager/images_manager.dart';
import '../../../core/resources/colors/colors_manager.dart';
import '../../auth/presentation/screen/login/login.dart';

class ItemHeader extends StatelessWidget {
  const ItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: Text(
            'Skip for now',
            style: context.bodySmall!.copyWith(color: ColorsManager.cyanColor),
          ),
        )
      ],
    );
  }
}
