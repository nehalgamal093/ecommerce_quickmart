import 'package:ecommerce_shop/core/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/resources/constants/strings_manager.dart';
import '../../../../../../core/widgets/loading_list.dart';
import '../../../../../cart/data/models/cart_model.dart';
import '../../../../../cart/presentation/bloc/my_cart_bloc.dart';
import '../../../../../product_info/presentation/screens/product_details/product_details.dart';

class Items extends StatelessWidget {
  static const String routeName = '/items';
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.items),
      ),
      body: BlocProvider(
        create: (context) => getIt<MyCartBloc>()..add(LoadCartItems()),
        child: BlocBuilder<MyCartBloc, MyCartState>(builder: (context, state) {
          if (state is ItemsLoading) {
            return LoadingList();
          } else if (state is ItemsError) {
            return Text(StringsManager.error);
          } else if (state is ItemsLoaded) {
            List<CartItem> cartItems = state.items;
            return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      isWishlist: true,
                      name: cartItems[index].product!.title!,
                      description: cartItems[index].product!.description!,
                      image:
                          cartItems[index].product!.images![0].attachmentFile!,
                      price: cartItems[index]
                          .product!
                          .priceAfterDiscount!
                          .toString(),
                      priceAfterDiscount:
                          cartItems[index].product!.price!.toString(),
                      id: cartItems[index].product!.id!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings:
                                RouteSettings(name: ProductDetails.routeName),
                            builder: (context) => ProductDetails(
                                id: cartItems[index].product!.id!),
                          ),
                        );
                      });
                });
          } else {
            return SizedBox();
          }
        }),
      ),
    );
  }
}
