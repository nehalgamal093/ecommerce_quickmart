import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/error_widget.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/constants/strings_manager.dart';
import '../sections/products_list.dart';

class ProductsScreen extends StatelessWidget {
  final String id;
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.smartWatches),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create: (context) => getIt<ProductsBloc>()
            ..add(
              GetProductsEvent(subCategoryId: id),
            ),
          child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            ProductsRequestState requestState = state.productsRequestState!;
            if (requestState == ProductsRequestState.loading) {
              return LoadingGrid(height: 200);
            } else if (requestState == ProductsRequestState.error) {
              return SomethingWentWrongWidget();
            } else if (requestState == ProductsRequestState.success) {
              return ProductsList(products: state.products!);
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
