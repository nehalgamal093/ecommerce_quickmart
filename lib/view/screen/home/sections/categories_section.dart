import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_small_horizontal_list.dart';
import 'package:ecommerce_shop/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/category_item.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/label_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
        if (state.categoriesRequestState == CategoriesRequestState.loading) {
          return LoadingSmallHorizontalList();
        } else if (state.categoriesRequestState ==
            CategoriesRequestState.error) {
          return Text('Error');
        } else if (state.categoriesRequestState ==
            CategoriesRequestState.success) {
          return Column(
            children: [
              LabelSection(label: StringsManager.categories),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        categoryModel: state.categories!.result![index],
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
        return SizedBox();
      }),
    );
  }
}
