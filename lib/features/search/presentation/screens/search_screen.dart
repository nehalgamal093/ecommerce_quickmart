import 'package:ecommerce_shop/core/resources/assets_manager/images_manager.dart';
import 'package:ecommerce_shop/core/widgets/custom_text_field.dart';
import 'package:ecommerce_shop/core/widgets/error_widget.dart';
import 'package:ecommerce_shop/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/constants/strings_manager.dart';
import '../../../../core/widgets/loading_grid.dart';
import '../bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<SearchBloc>()..add(SearchProductsEvent()),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                    return CustomTextField(
                        hintText: StringsManager.searchProduct,
                        controller: searchController,
                        onChanged: (val) {
                          if (val != null || val.isNotEmpty) {
                            var bloc = BlocProvider.of<SearchBloc>(context);
                            bloc.add(SearchTextEvent(val));
                          }
                        });
                  }),
                  BlocBuilder<SearchBloc, SearchState>(
                      builder: (context, state) {
                    if (state.searchRequestState ==
                        SearchRequestState.loading) {
                      return Expanded(child: LoadingGrid(height: 100));
                    } else if (state.searchRequestState ==
                        SearchRequestState.error) {
                      return SizedBox();
                    } else if (state.searchRequestState ==
                        SearchRequestState.success) {
                      var searchedProducts = state.products ?? [];
                      return Expanded(
                        child:searchedProducts.isEmpty? SomethingWentWrongWidget(title: '', img: ImagesManager.searchList): GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 150 / 270),
                          itemCount: searchedProducts.length,
                          itemBuilder: (context, index) {
                            return ProductItem(
                                productModel: searchedProducts[index]);
                          },
                        ),
                      );
                    } else {
                     return  Expanded(child: SomethingWentWrongWidget(title: '', img: ImagesManager.searchList));
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
