import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/sections/categories_section.dart';
import 'package:ecommerce_shop/view/screen/home/sections/header_section.dart';
import 'package:ecommerce_shop/view/screen/home/sections/products_section.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/label_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
import '../../../core/widgets/loading_grid.dart';
import '../../../features/products/presentation/bloc/products_bloc.dart';
import '../../resources/assets_manager/images_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
        actions: [
          ImageIcon(AssetImage(ImagesManager.searchIcon)),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(ImagesManager.avatar),
            radius: 15,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocProvider(
                  create: (context) => getIt<ProductsBloc>()
                    ..add(GetProductsEvent(subCategoryId: "67d7538f55679798bbbae04f")),
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                    if (state.productsRequestState == ProductsRequestState.loading) {
                      return LoadingGrid(height: 100);
                    } else if (state.productsRequestState ==
                        ProductsRequestState.error) {
                      return Text('Error');
                    } else if (state.productsRequestState ==
                        ProductsRequestState.success) {
                      return CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          SliverToBoxAdapter(child: HeaderSection()),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: size.height * .12,
                              child: CategoriesSection(),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: LabelSection(label: StringsManager.latestProducts),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 24,
                            ),
                          ),
                          ProductsSection(products: state.products!,)
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                ),
              )

    );
  }
}
