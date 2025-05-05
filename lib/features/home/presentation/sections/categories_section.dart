import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/error_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_small_horizontal_list.dart';
import 'package:ecommerce_shop/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_shop/features/home/presentation/sections/catergories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../core/resources/constants/strings_manager.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
        CategoriesRequestState? categoryState = state.categoriesRequestState;

        if (categoryState == CategoriesRequestState.loading) {
          return LoadingSmallHorizontalList();
        } else if (categoryState == CategoriesRequestState.error) {
          return SomethingWentWrongWidget(
              title: StringsManager.somethingWentWrong,
              img: ImagesManager.somethingWrong);
        } else if (categoryState == CategoriesRequestState.success) {
          return CategoriesList(state: state);
        }
        return SizedBox();
      }),
    );
  }
}
