import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class WriteReviewField extends StatelessWidget {
  final TextEditingController textEditingController;

  const WriteReviewField({super.key,required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write your review',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 10,),
        CustomTextField(
          hintText: 'Would you like to write anything about this product',
          maxLines: 3, controller: textEditingController, onChanged: (String ) {  },
        )
      ],
    );
  }
}
