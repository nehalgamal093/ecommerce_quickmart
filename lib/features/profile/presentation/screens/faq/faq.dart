import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/faq_model.dart';

class FAQ extends StatelessWidget {
  static const String routeName = '/faq';
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: faqList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(faqList[index].question),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          faqList[index].answer,
                          style: context.bodySmall,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('For any query, you can visit our website for'),
                TextButton(onPressed: () {}, child: Text('Help Center'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
