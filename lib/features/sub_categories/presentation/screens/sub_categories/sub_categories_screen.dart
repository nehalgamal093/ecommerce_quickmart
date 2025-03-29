import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/widgets/sub_categories_item.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../products/presentation/screens/products_screen/products_screen.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const String routeName = '/sub_categories';
  final String id;
  const SubCategoriesScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: Text(StringsManager.electronics),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocProvider(
                    create: (context) =>
                        getIt<SubCategoriesBloc>()..add(GetSubCategoriesEvent(id)),
                    child: BlocBuilder<SubCategoriesBloc, SubCategoriesState>(
                        builder: (context, state) {
                      if (state.subCatRequestState == SubCatRequestState.loading) {
                        return LoadingGrid(
                          height: 150,
                        );
                      } else if (state.subCatRequestState == SubCatRequestState.error) {
                        return Text('error');
                      } else if (state.subCatRequestState ==
                          SubCatRequestState.success) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: GridView.builder(
                                  itemCount: state.categories!.result!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 20,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 160 / 180),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductsScreen(
                                                  id: state
                                                      .categories!.result![index].id!)),
                                        );

                                      },
                                      child: SubCategoriesItem(
                                          categoryModel:
                                              state.categories!.result![index]),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    })),
              ),


    );
  }
}
