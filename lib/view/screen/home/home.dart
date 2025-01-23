import 'package:ecommerce_shop/view/resources/colors/colors_manager.dart';
import 'package:ecommerce_shop/view/resources/strings_manager.dart';
import 'package:ecommerce_shop/view/screen/home/sections/categories_section.dart';
import 'package:ecommerce_shop/view/screen/home/sections/header_section.dart';
import 'package:ecommerce_shop/view/screen/home/sections/products_section.dart';
import 'package:ecommerce_shop/view/screen/home/widgets/label_section.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/product_item.dart';
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
        child: CustomScrollView(
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
                child: LabelSection(label: StringsManager.latestProducts)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),

            ProductsSection()
          ],
        ),
      ),
    );
  }
}
