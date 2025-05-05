import '../../import_files/import_files.dart';

class PrivacyPolicySection extends StatelessWidget {
  const PrivacyPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: StringsManager.agreePrivacy,
            style:
                context.bodySmall!.copyWith(color: ColorsManager.blackColor)),
        TextSpan(
          text: StringsManager.privacyPolicy,
          style: context.bodySmall!.copyWith(color: ColorsManager.blueColor),
        ),
        TextSpan(
          text: StringsManager.and,
          style: context.bodySmall!.copyWith(color: ColorsManager.blackColor),
        ),
        TextSpan(
          text: StringsManager.termsAndConditions,
          style: context.bodySmall!.copyWith(color: ColorsManager.blueColor),
        )
      ]),
    );
  }
}
