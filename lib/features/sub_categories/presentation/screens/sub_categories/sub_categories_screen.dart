import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/bloc/sub_categories_bloc.dart';
import 'package:ecommerce_shop/features/sub_categories/presentation/screens/sub_categories/widgets/sub_cat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/constants/strings_manager.dart';

class SubCategoriesScreen extends StatelessWidget {
  static const String routeName = '/sub_categories';
  final String id;
  final String title;
  const SubCategoriesScreen({super.key, required this.id,required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
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
                return Text(StringsManager.error);
              } else if (state.subCatRequestState ==
                  SubCatRequestState.success) {
                return Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: SubCatList(categories: state.categories!),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
          ),
        ),
      ),
    );
  }
}
//--
