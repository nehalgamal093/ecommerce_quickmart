import 'package:flutter/material.dart';

import '../widgets/productWithLabel.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index){
      return ProductWithLabel();
    });
  }
}
