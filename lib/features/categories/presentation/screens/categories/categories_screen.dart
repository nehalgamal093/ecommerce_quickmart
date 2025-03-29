import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:ecommerce_shop/features/categories/presentation/screens/categories/widgets/category_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../sub_categories/presentation/screens/sub_categories/sub_categories_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: Text('Categories'),
              ),
              body: BlocProvider(
                create: (context) =>
                    getIt<CategoriesBloc>()..add(GetCategoriesEvent()),
                child: BlocBuilder<CategoriesBloc, CategoriesState>(
                    builder: (context, state) {
                  if (state.categoriesRequestState ==
                      CategoriesRequestState.loading) {
                    return LoadingGrid(
                      height: 100,
                    );
                  } else if (state.categoriesRequestState ==
                      CategoriesRequestState.error) {
                    return Text('Error');
                  } else if (state.categoriesRequestState ==
                      CategoriesRequestState.success) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: GridView.builder(
                              itemCount: state.categories?.result?.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 160 / 100),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SubCategoriesScreen(
                                                  id: state.categories!
                                                      .result![index].id!)),
                                    );
                                  },
                                  child: CategoryListItem(
                                    categoryModel:
                                        state.categories!.result![index],
                                  ),
                                );
                              }),
                        )
                      ],
                    );
                  }
                  return SizedBox();
                }),
              ),
            );

  }
}
