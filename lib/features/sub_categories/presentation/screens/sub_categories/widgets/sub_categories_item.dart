import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shop/core/extensions/text_theme.dart';
import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../../../../core/widgets/loading_grid.dart';

class SubCategoriesItem extends StatelessWidget {
  final Result categoryModel;
  const SubCategoriesItem({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    Size size = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment:
              isPortrait ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
                fit: BoxFit.cover,
                width: isPortrait ? size.width * .40 : size.width * .50,
                height: isPortrait ? size.height * .20 : size.height * .40,
              imageUrl: categoryModel.image!,
              placeholder: (context, url) => loadingItem(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryModel.name!,
              style: context.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700, color: ColorsManager.blackColor),
            )
          ],
        ),
      ),
    );
  }
}
