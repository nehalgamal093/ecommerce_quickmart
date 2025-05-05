import 'package:ecommerce_shop/core/resources/constants/strings_manager.dart';
import 'package:ecommerce_shop/core/widgets/error_widget.dart';
import 'package:ecommerce_shop/features/home/presentation/sections/categories_section.dart';
import 'package:ecommerce_shop/features/home/presentation/sections/header_section.dart';
import 'package:ecommerce_shop/features/home/presentation/sections/loading_home.dart';
import 'package:ecommerce_shop/features/home/presentation/sections/products_section.dart';
import 'package:ecommerce_shop/features/home/presentation/widgets/label_section.dart';
import 'package:ecommerce_shop/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/products/presentation/bloc/products_bloc.dart';
import '../../../core/resources/assets_manager/images_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImagesManager.logo,
          width: 100,
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: ImageIcon(AssetImage(ImagesManager.searchIcon))),
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
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state.productsRequestState == ProductsRequestState.loading) {
            return LoadingHome();
          } else if (state.productsRequestState == ProductsRequestState.error) {
            return SomethingWentWrongWidget(
                title: StringsManager.somethingWentWrong,
                img: ImagesManager.somethingWrong);
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
                    height: isPortrait ? size.height * .15 : size.height * .25,
                    width: isPortrait ? size.width * .2 : size.width * .2,
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
    );
  }
}
