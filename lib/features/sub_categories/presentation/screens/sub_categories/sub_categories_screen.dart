import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/widgets/sub_categories_item.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const String routeName = '/sub_categories';
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
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
                  if(state.subCatRequestState == SubCatRequestState.loading){
                    return LoadingGrid(height: 150,);
                  }
              else if (state.subCatRequestState == SubCatRequestState.error) {
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
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              childAspectRatio: 160 / 180),
                          itemBuilder: (context, index) {
                            return SubCategoriesItem(
                                categoryModel:
                                    state.categories!.result![index]);
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
