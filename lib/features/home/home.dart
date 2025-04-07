import 'package:ecommerce_shop/features/home/sections/categories_section.dart';
import 'package:ecommerce_shop/features/home/sections/header_section.dart';
import 'package:ecommerce_shop/features/home/sections/products_section.dart';
import 'package:ecommerce_shop/features/home/widgets/label_section.dart';
import 'package:ecommerce_shop/features/home/widgets/loading_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/di.dart';
import '../../../features/products/presentation/bloc/products_bloc.dart';
import '../../core/resources/assets_manager/images_manager.dart';
import '../../core/resources/strings_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
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
              return LoadingHome();
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
                      height:isPortrait ?size.height*.15: size.height * .25,
                      width:isPortrait ?size.width*.2: size.width * .2,
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
                  ProductsSection(
                    products: state.products!,
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 24,
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
