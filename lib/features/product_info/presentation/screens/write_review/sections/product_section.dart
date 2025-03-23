import 'package:flutter/material.dart';

import '../../../../data/model/product_details_model.dart';

class ProductSection extends StatelessWidget {
  final Result product;
  const ProductSection({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.network(product.images![0].attachmentFile!,width: 100,height: 100,),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: size.width*.6,
                child: Text(product.title!,style: Theme.of(context).textTheme.bodyMedium,)),
            SizedBox(
              width: size.width*.6,
              child: Wrap(
                children: [
                  Text(product.description!,style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
