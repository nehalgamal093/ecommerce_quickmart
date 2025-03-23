import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/loading_grid.dart';
import 'package:ecommerce_shop/features/products/presentation/bloc/products_bloc.dart';
import 'package:ecommerce_shop/view/common_widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product_info/presentation/screens/product_details/product_details.dart';

class ProductsScreen extends StatelessWidget {
  final String id;
  static const String routeName = '/products_screen';
  const ProductsScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Watches'),
      ),
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              settings: settings,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocProvider(
                  create: (context) => getIt<ProductsBloc>()
                    ..add(GetProductsEvent(subCategoryId: id)),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                    if (state.productsRequestState == ProductsRequestState.loading) {
                      return LoadingGrid(height: 100);
                    } else if (state.productsRequestState ==
                        ProductsRequestState.error) {
                      return Text('Error');
                    } else if (state.productsRequestState ==
                        ProductsRequestState.success) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 150 / 270),
                                itemCount: state.products!.result!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(id: state.products!.result![index].id!)));


                                    },
                                    child: ProductItem(
                                        productModel: state.products!.result![index]),
                                  );
                                }),
                          )
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                ),
              );
            }
          );
        }
      ),
    );
  }
}
