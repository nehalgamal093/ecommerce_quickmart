import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class PrivacyPolicySection extends StatelessWidget {
  const PrivacyPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: StringsManager.agreePrivacy,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorsManager.blackColor)),
        TextSpan(
          text: StringsManager.privacyPolicy,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorsManager.blueColor),
        ),
        TextSpan(
          text: StringsManager.and,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorsManager.blackColor),
        ),
        TextSpan(
          text: StringsManager.termsAndConditions,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: ColorsManager.blueColor),
        )
      ]),
    );
  }
}
