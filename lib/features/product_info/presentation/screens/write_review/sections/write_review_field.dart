import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class WriteReviewField extends StatelessWidget {
  final TextEditingController textEditingController;

  const WriteReviewField({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.writeYourReview,
          style: context.titleLarge,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          hintText: StringsManager.wouldYouLikeToWriteProduct,
          maxLines: 3,
          controller: textEditingController,
          onChanged: (String val) {},
        )
      ],
    );
  }
}
