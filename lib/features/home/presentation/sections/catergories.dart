import 'package:ecommerce_shop/features/categories/data/models/categories.dart';
import 'package:ecommerce_shop/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/constants/strings_manager.dart';
import '../../../sub_categories/presentation/screens/sub_categories/sub_categories_screen.dart';
import '../widgets/category_item.dart';
import '../widgets/label_section.dart';

class CategoriesList extends StatelessWidget {
  final CategoriesState state;

  const CategoriesList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    List<Result> results = state.categories!.result!;
    return Column(
      children: [
        LabelSection(label: StringsManager.categories),
        SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubCategoriesScreen(id: results[index].id!),
                      ),
                    );
                  },
                  child: CategoryItem(
                    categoryModel: state.categories!.result![index],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: state.categories!.result!.length),
        )
      ],
    );
  }
}
//69
